#!/usr/bin/env python3
# /// script
# dependencies = [
#   "cvss>=3.0",
# ]
# ///
#
# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: LGPL2

import argparse
import json
import re
import sys
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

from cvss import CVSS3, CVSS4

CVSS_TYPES = ("CVSS_V4", "CVSS_V3", "CVSS_V2")
MAX_SUMMARY = 250

MARKDEEP_BLOB = (
    "<!-- Markdeep: -->"
    '<style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>'
    '<script src="markdeep.min.js" charset="utf-8"></script>'
    '<script src="https://morgan3d.github.io/markdeep/latest/markdeep.min.js" charset="utf-8"></script>'
    '<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>'
)


def get_bst_element(package: dict) -> str | None:
    """Return the BuildStream element path from an SPDX package."""
    for ref in package.get("externalRefs", []):
        if (
            ref.get("referenceCategory") == "OTHER"
            and ref.get("referenceType") == "bst-element"
        ):
            return ref["referenceLocator"]
    return None


def _newest_affected_version(affected: list[dict]) -> str | None:
    """Return the newest affected version or range from OSV affected entries."""

    def is_version(value: str | None) -> bool:
        return (
            bool(value)
            and value not in ("0", "0.0.0-0")
            and not re.fullmatch(r"[0-9a-f]{40}", value)
        )

    def sort_key(value: str) -> tuple[int, ...]:
        upper_bound = value.rsplit(",", maxsplit=1)[-1]
        return tuple(int(part) for part in re.findall(r"\d+", upper_bound))

    candidates = []
    for entry in affected:
        range_candidates = []
        for version_range in entry.get("ranges") or []:
            introduced = None
            open_ended = False
            for event in version_range.get("events") or []:
                if "introduced" in event:
                    introduced = event["introduced"]
                    open_ended = True
                    continue
                end = (
                    event.get("fixed")
                    or event.get("last_affected")
                    or event.get("limit")
                )
                inclusive = "last_affected" in event
                operator = "<=" if inclusive else "<"
                start = introduced if is_version(introduced) else None
                stop = end if is_version(end) else None
                if start and stop:
                    range_candidates.append(f">= {start}, {operator} {stop}")
                elif stop:
                    range_candidates.append(f"{operator} {stop}")
                elif start:
                    range_candidates.append(f">= {start}")
                open_ended = False
            if open_ended and is_version(introduced):
                range_candidates.append(f">= {introduced}")
        candidates.extend(range_candidates or (entry.get("versions") or []))

    return max(candidates, key=sort_key, default=None)


def get_affected_info(data: dict) -> tuple[str, str]:
    """Get the newest affected version and package identity from OSV data."""
    affected = data.get("affected") or []
    # Prefer entries that identify their package, as they also carry the
    # useful version ranges rather than exhaustive version lists.
    packaged = [entry for entry in affected if entry.get("package")]
    if packaged:
        affected = packaged

    version = _newest_affected_version(affected) or "Unknown"

    packages = []
    for entry in affected:
        package = entry.get("package") or {}
        label = package.get("purl")
        if not label and package.get("ecosystem") and package.get("name"):
            label = f"{package['ecosystem']}:{package['name']}"
        label = label or package.get("name")
        if label and label not in packages:
            packages.append(label)

    return version, ", ".join(packages) if packages else " "


def calculate_cvss_score(severity_vector: str) -> str:
    """Calculate CVSS score using cvss library if available."""
    score = "Not Scored"
    vector_str = str(severity_vector)
    if vector_str.startswith("CVSS:4"):
        c = CVSS4(vector_str)
        if hasattr(c, "scores"):
            score = c.scores()[0]
        if hasattr(c, "base_score"):
            score = c.base_score
        return f"{score} (CVSS_V4)"
    if vector_str.startswith("CVSS:3"):
        c = CVSS3(vector_str)
        if hasattr(c, "scores"):
            score = c.scores()[0]
        if hasattr(c, "base_score"):
            score = c.base_score
        return f"{score} (CVSS_V3)"
    return f"{score} (CVSS_V2)"


def get_cve_info(cve_id: str) -> dict:
    """Get CVE severity and summary from OSV API."""
    url = f"https://api.osv.dev/v1/vulns/{cve_id}"
    try:
        req = urllib.request.Request(url)
        req.add_header("Accept", "application/json")
        with urllib.request.urlopen(req, timeout=10) as response:
            data = json.loads(response.read().decode("utf-8"))
    except (
        urllib.error.URLError,
        urllib.error.HTTPError,
        TimeoutError,
        OSError,
        json.JSONDecodeError,
    ):
        return {"severity": None, "summary": None}

    summary = data.get("summary") or data.get("details")

    # stop the summaries breaking formatting
    summary = summary.split("\n")[0]
    summary = summary.replace("`", "").replace("|", "")
    if len(summary) > MAX_SUMMARY:
        summary = summary[:MAX_SUMMARY] + "..."

    severity = None
    severity_vectors = []
    # Try to extract severity from severity array
    for sev in data.get("severity", []) or []:
        if sev.get("type") in CVSS_TYPES:
            severity_vectors.append(sev.get("score"))

    if severity_vectors:
        severity = ", ".join(calculate_cvss_score(v) for v in severity_vectors)

    if severity is None and data.get("database_specific"):
        db = data.get("database_specific") or {}
        severity = db.get("severity") or db.get("cvss_score")

    if severity is None and data.get("affected"):
        for affected in data.get("affected", []):
            db = affected.get("database_specific") or {}
            if db.get("severity"):
                severity = db.get("severity")
                break

    affected_versions, package = get_affected_info(data)

    return {
        "severity": severity,
        "summary": summary,
        "severity_vector": ", ".join(severity_vectors) if severity_vectors else None,
        "affected_versions": affected_versions,
        "package": package,
    }


def fetch_cve(item: tuple) -> dict:
    cve_id, cve_data = item
    cve_info = get_cve_info(cve_id)
    severity = cve_info.get("severity")
    return {
        "CVE": f"[{cve_id}]({cve_data['link']})",
        "Severity": severity if severity is not None else "Not Scored",
        "Package": cve_info.get("package") or "",
        "Affected Elements": " ".join(f"`{x}`" for x in cve_data["elements"]),
        "Affected Versions": cve_info.get("affected_versions") or "Not Listed",
        "Summary": cve_info.get("summary")
        if cve_info.get("summary") is not None
        else " ",
    }


def collect_cves(spdx: dict) -> str:
    cves = {}

    for package in spdx.get("packages", []):
        element = get_bst_element(package)
        if element is None:
            continue

        for ref in package.get("externalRefs", []):
            if (
                ref.get("referenceCategory") == "SECURITY"
                and ref.get("referenceType") == "advisory"
            ):
                if ref.get("referenceLocator"):
                    cve_id = ref.get("referenceLocator").split("/")[-1]
                else:
                    continue

                if cve_id not in cves:
                    cves[cve_id] = {
                        "cve_id": cve_id,
                        "link": ref.get("referenceLocator"),
                        "elements": set(),
                    }
                cves[cve_id]["elements"].add(element)

    result_list = []
    cve_items = list(cves.items())

    with ThreadPoolExecutor(max_workers=20) as executor:
        future_to_cve = {executor.submit(fetch_cve, item): item for item in cve_items}
        for future in as_completed(future_to_cve):
            result_list.append(future.result())

    def severity_sort_key(row):
        severity = row["Severity"]
        if severity == "Not Scored":
            return 0.0
        try:
            return float(severity.split(" ")[0])
        except ValueError:
            return 0.0

    result_list.sort(key=severity_sort_key, reverse=True)

    return format_as_markdown(result_list)


def format_as_markdown(result: list[dict]) -> str:
    keys = result[0].keys()
    sep = "|" + "|".join("--" for _ in keys) + "|\n"
    header = "|" + "|".join(keys) + "|\n"
    body = ""
    for r in result:
        body += "|" + "|".join(str(r[x]) for x in keys) + "|\n"
    return header + sep + body + "\n\n" + MARKDEEP_BLOB


def main():
    parser = argparse.ArgumentParser(
        description="Convert an SPDX JSON SBOM to a markdown CVE report."
    )
    parser.add_argument("input", type=Path, help="Input SPDX JSON file")
    parser.add_argument(
        "-o",
        "--output",
        type=Path,
        default=Path("report.md.html"),
        help="Output path (default: report.md.html)",
    )

    args = parser.parse_args()

    try:
        with args.input.open(encoding="utf-8") as f:
            spdx = json.load(f)

        result = collect_cves(spdx)
        cve_output = args.output
        if not cve_output.name.endswith(".md.html"):
            cve_output = args.output.parent / (args.output.stem + ".md.html")
        cve_output.parent.mkdir(exist_ok=True, parents=True)
        cve_output.write_text(result)
        print(f"Wrote CVEs to {cve_output}")
        return 0
    except (OSError, json.JSONDecodeError, KeyError) as exc:
        print(f"Error: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
