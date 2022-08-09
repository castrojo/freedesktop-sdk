"""
Downloads CVE database


Usage:
  python3 update_local_cve_database.py

This tool will create files in the current
directory:
 - nvdcve-2.0-*.xml.gz: The cached raw XML databases from the CVE database.
 - nvdcve-2.0-*.xml.gz.etag: Related etags for downloaded files
"""

import datetime
import os.path

import requests
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

TIMEOUT = (10, 30)


def update_year(session, year):
    url = f'https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-{year}.json.gz'
    headers = {}
    filename = f'nvdcve-1.1-{year}.json.gz'
    if os.path.exists(filename):
        try:
            with open(f"{filename}.etag", encoding="utf-8") as file:
                etag = file.read()
        except FileNotFoundError:
            etag = None
        else:
            headers["If-None-Match"] = etag
    else:
        etag = None

    response = session.get(url, headers=headers, stream=True,
                           timeout=TIMEOUT)
    if not response.ok:
        if response.status_code == 404:
            print(f"nvdce-1.1-{year}.json.gz not found".format)
            for _ in response.iter_content():
                pass
    elif response.status_code == 304:
        response.close()
        print("Cached nvdce-1.1-{year}.json.gz")
    else:
        etag = response.headers["ETag"]
        assert etag is not None
        with open(filename, 'wb') as file:
            for chunk in response.iter_content(1024**2):
                file.write(chunk)
            print(f"Downloaded {file.name}")
            with open(f"{filename}.etag", "w", encoding="utf-8") as file:
                file.write(etag)

if __name__ == "__main__":
    entries = []
    with requests.session() as session:
        retries = Retry(total=5, backoff_factor=1)
        session.mount('https://', HTTPAdapter(max_retries=retries))
        for item in range(2002, datetime.datetime.now().year + 1):
            update_year(session, str(item))
