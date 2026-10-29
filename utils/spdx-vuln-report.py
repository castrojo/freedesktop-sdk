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
import sys
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

from cvss import CVSS3, CVSS4

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
    if vector_str.startswith("CVSS:3"):
        c = CVSS3(vector_str)
        if hasattr(c, "scores"):
            score = c.scores()[0]
        if hasattr(c, "base_score"):
            score = c.base_score
    return str(score)


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
    severity_vector = None
    # Try to extract severity from severity array
    for sev in data.get("severity", []) or []:
        if sev.get("type") in ("CVSS_V4", "CVSS_V3", "CVSS_V2"):
            severity_vector = sev.get("score")
            severity = severity_vector
            break

    if severity_vector:
        calculated = calculate_cvss_score(severity_vector)
        if calculated is not None:
            severity = calculated

    if severity is None and data.get("database_specific"):
        db = data.get("database_specific") or {}
        severity = db.get("severity") or db.get("cvss_score")

    if severity is None and data.get("affected"):
        for affected in data.get("affected", []):
            db = affected.get("database_specific") or {}
            if db.get("severity"):
                severity = db.get("severity")
                break

    return {
        "severity": severity,
        "summary": summary,
        "severity_vector": severity_vector,
    }


def fetch_cve(item: tuple) -> dict:
    cve_id, cve_data = item
    cve_info = get_cve_info(cve_id)
    severity = cve_info.get("severity")
    severity_vector = cve_info.get("severity_vector")
    return {
        "CVE": f"[{cve_id}]({cve_data['link']})",
        "Severity": severity if severity is not None else "Not Scored",
        "Affected Elements": " ".join(f"`{x}`" for x in cve_data["elements"]),
        "Summary": cve_info.get("summary")
        if cve_info.get("summary") is not None
        else "",
        "Severity Vector": severity_vector
        if severity_vector is not None
        else "Not Scored",
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
    result_list.sort(
        key=lambda x: float(x["Severity"]) if x["Severity"] != "Not Scored" else 0.0,
        reverse=True,
    )

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
