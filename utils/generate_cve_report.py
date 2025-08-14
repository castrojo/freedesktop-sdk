#!/usr/bin/env python3
"""
Downloads CVE database and generate HTML output with all current CVEs for a given manifest.

Usage:
  python3 generate-cve-report.py path/to/manifest.json output.html

This tool will create files in the current
directory:
 - nvdcve-2.0-*.xml.gz: The cached raw XML databases from the CVE database.
 - nvdcve-2.0-*.xml.gz.etag: Related etags for downloaded files

Files are not downloaded if not modified. But we still verify with the
remote database we have the latest version of the files.
"""

import datetime
import glob
import gzip
import html
import json
import os
import re
import sys

import requests
from libversion import Version

LOOKUP_TABLE = {}
unversioned_git = {}
unversioned_archive = {}

with open(sys.argv[1], "rb") as f:
    manifest = json.load(f)
    for module in manifest["modules"]:
        cpe = module["x-cpe"]
        version = cpe.get("version")
        if version:
            print(f"Found version {version} for module {module['name']}")
        else:
            print(
                f"Failed to find a version for module {module['name']}, assuming unversioned"
            )
            sources = module["sources"]
            for element in sources:
                if "commit" in element and element["type"] == "git":
                    unversioned_git[module["name"]] = {
                        "source": element["commit"],
                        "url": element["url"],
                        "product": cpe.get("product"),
                        "cve_ids": set(),
                    }
                if "url" in element and element["type"] == "archive":
                    unversioned_archive[module["name"]] = {
                        "source": element["url"],
                        "product": cpe.get("product"),
                        "cve_ids": set(),
                    }
            continue
        vendor = cpe.get("vendor")
        vendor_dict = LOOKUP_TABLE.setdefault(cpe.get("vendor"), {})
        vendor_dict[cpe["product"]] = {
            "name": module["name"],
            "version": version,
            "patches": cpe.get("patches", []),
            "ignored": cpe.get("ignored", []),
            "exclude-vendor": cpe.get("exclude-vendor", []),
        }


def extract_product_vulns_sub(node):
    if "cpeMatch" in node:
        for cpe_match in node["cpeMatch"]:
            if cpe_match["vulnerable"]:
                yield cpe_match
    else:
        for child in node.get("children", []):
            yield from extract_product_vulns_sub(child)


def extract_product_vulns(tree):
    for item in tree["vulnerabilities"]:
        summary = (
            item["cve"]["descriptions"][0]["value"]
            .replace("\n", " ")
            .strip()
        )
        scorev2 = (
            item["cve"]["metrics"].get("cvssMetricV2", [{}])[0].get("cvssData", {}).get("baseScore")
        )
        scorev3 = (
            item["cve"]["metrics"].get("cvssMetricV31", [{}])[0].get("cvssData", {}).get("baseScore", None)
        )

        cve_id = item["cve"]["id"]
        for node in item["cve"].get("configurations", [{}])[0].get("nodes", []):
            for cpe_match in extract_product_vulns_sub(node):
                yield cve_id, summary, scorev2, scorev3, cpe_match


api = os.environ.get("CI_API_V4_URL")
project_id = os.environ.get("CI_PROJECT_ID")
token = os.environ.get("GITLAB_TOKEN")


def get_entries(entry_char, entry_type, cveid):
    resp = requests.get(
        f"{api}/projects/{project_id}/{entry_type}?search={cveid}",
        headers={"Authorization": f"Bearer {token}"},
        timeout=30 * 60,
    )
    if resp.ok:
        for entry in resp.json():
            iid = entry.get("iid")
            yield f"{entry_char}{iid}", entry.get("web_url")
    else:
        print(resp.status_code, resp.text)


def get_issues_and_mrs(cveid):
    if not api or not project_id or not token:
        return
    for entry_name, url in get_entries("!", "merge_requests", cveid):
        yield entry_name, url
    for entry_name, url in get_entries("#", "issues", cveid):
        yield entry_name, url


def check_version_range(version, cpe_match):
    vulnerable = True
    version_object = Version(version)
    if "versionStartIncluding" in cpe_match:
        start = Version(cpe_match["versionStartIncluding"])
        if version_object < start:
            vulnerable = False
    elif "versionStartExcluding" in cpe_match:
        start = Version(cpe_match["versionStartExcluding"])
        if version_object <= start:
            vulnerable = False
    if "versionEndIncluding" in cpe_match:
        end = Version(cpe_match["versionEndIncluding"])
        if version_object > end:
            vulnerable = False
    elif "versionEndExcluding" in cpe_match:
        end = Version(cpe_match["versionEndExcluding"])
        if version_object >= end:
            vulnerable = False
    return vulnerable


def extract_vulnerabilities(filename):
    print(f"Processing {filename}")
    with gzip.open(filename) as file:
        tree = json.load(file)
        for cve_id, summary, scorev2, scorev3, cpe_match in extract_product_vulns(tree):
            product_name = cpe_match["criteria"]
            vendor, name, version = product_name.split(":")[3:6]

            module = LOOKUP_TABLE.get(vendor, {}).get(name)
            if not module:
                module = LOOKUP_TABLE.get(None, {}).get(name)
            if not module:
                continue
            if vendor in module["exclude-vendor"]:
                print(f"Ignoring vendor {vendor}, listed in exclude-vendor")
                continue

            if cve_id in module["patches"]:
                print(f"Ignoring {cve_id}, found in patches")
                vulnerable = False
            elif cve_id in module["ignored"]:
                print(f"Ignoring {cve_id}, found in ignored")
                vulnerable = False
            elif module["version"] == version:
                vulnerable = True
            elif version == "*":
                vulnerable = True
                version = module["version"]
                try:
                    vulnerable = check_version_range(version, cpe_match)
                except TypeError as exc:
                    raise SystemExit(
                        f"{module} comparison against {cpe_match} ({cve_id})"
                    ) from exc
            else:
                vulnerable = False
            if vulnerable:
                print(
                    f"Found vulnerable: {cve_id} for vendor {vendor} and product {name}"
                )
            yield (
                cve_id,
                module["name"],
                module["version"],
                summary,
                scorev2,
                scorev3,
                vulnerable,
            )


def check_unversioned_elements(filename, unversioned_git, unversioned_archive):
    with gzip.open(filename) as file:
        tree = json.load(file)
        for cve_id, _, _, _, cpe_match in extract_product_vulns(tree):
            product_name = cpe_match["criteria"]
            _, name, _ = product_name.split(":")[3:6]
            for element in unversioned_git:
                if name == unversioned_git[element]["product"]:
                    unversioned_git[element]["cve_ids"].add(
                        f"<nobr>[{cve_id}](https://nvd.nist.gov/vuln/detail/{cve_id})</nobr>"
                    )
            for element in unversioned_archive:
                if name == unversioned_archive[element]["product"]:
                    unversioned_archive[element]["cve_ids"].add(
                        f"<nobr>[{cve_id}(https://nvd.nist.gov/vuln/detail/{cve_id})</nobr>"
                    )


def maybe_score(item):
    try:
        return float(item)
    except (ValueError, TypeError):
        return -1


def by_score(entry):
    scorev2 = maybe_score(entry[4])
    scorev3 = maybe_score(entry[5])
    return scorev3, scorev2


def format_score(score):
    if score is None:
        return ""
    return score


def is_git_hash(s: str) -> bool:
    return bool(re.fullmatch(r"[0-9a-f]{6,40}", s, re.IGNORECASE))


def is_recent_cve(cve_id: str) -> bool:
    current_year = datetime.datetime.now(tz=datetime.timezone.utc).year
    valid_years = (current_year, current_year - 1, current_year - 2)

    matched = re.match(r"CVE-(\d{4})-\d+", cve_id)
    if matched:
        year = int(matched.group(1))
        return year in valid_years

    return False


if __name__ == "__main__":
    vuln_map = {}
    database_files = sorted(glob.glob("nvdcve-2.0-*.json.gz"))
    for filename in database_files:
        for (
            cve_id,
            name,
            version,
            summary,
            scorev2,
            scorev3,
            vulnerable,
        ) in extract_vulnerabilities(filename):
            if vulnerable:
                print(f"Adding {cve_id} for {name} to final vulnerabilities map")
                vuln_map[cve_id] = cve_id, name, version, summary, scorev2, scorev3

        check_unversioned_elements(filename, unversioned_git, unversioned_archive)

    entries = list(vuln_map.values())

    entries.sort(key=by_score, reverse=True)

    with open(sys.argv[2], "w", encoding="utf-8") as out:
        if not database_files:
            out.write("No CVE database files found\n")
        elif database_files and not entries:
            out.write("No CVE data affecting any element found\n")
        else:
            out.write(
                "|Vulnerability|Element|Version|Summary|CVSS V3.x|CVSS V2.0|WIP|\n"
            )
            out.write("|---|---|---|---|---|---|---|\n")

            for ID, name, version, summary, scorev2, scorev3 in entries:
                issues_mrs = (
                    ", ".join(f"[{id}]({link})" for id, link in get_issues_and_mrs(ID))
                    or "None"
                )
                out.write(
                    f"|[{ID}](https://nvd.nist.gov/vuln/detail/{ID})|{name}|{version}|{html.escape(summary)}|{format_score(scorev3)}|{format_score(scorev2)}|{issues_mrs}|\n"
                )

        out.write("\n\n\n")

        if not (unversioned_git or unversioned_archive):
            out.write("No unversioned element found\n")
        else:
            out.write("|Elements missing version data|Data|\n")
            out.write("|---|---|\n")
            for element, info in unversioned_archive.items():
                out.write(f"|{element}|{info['source']}\n")

            for element, info in unversioned_git.items():
                source, cve_ids, url = (
                    info.get("source"),
                    info.get("cve_ids"),
                    info.get("url"),
                )
                if source and cve_ids and not is_git_hash(source):
                    cve_list = ",<br>".join(
                        cve for cve in cve_ids if is_recent_cve(cve)
                    )
                else:
                    cve_list = ""
                out.write(f"|{element}|{url} {source} {cve_list}\n")

        out.write(
            "<!-- Markdeep: -->"
            '<style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>'
            '<script src="markdeep.min.js" charset="utf-8"></script>'
            '<script src="https://morgan3d.github.io/markdeep/latest/markdeep.min.js" charset="utf-8"></script>'
            '<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>'
        )
