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
import urllib.request
import urllib.parse
from contextlib import contextmanager, ExitStack
import signal
import socket
import os.path


class UrlOpenTimeout:

    def __init__(self):
        self._max = 120
        self._min = 5
        self._timeout = self._max

    @contextmanager
    def open(self, req):
        with ExitStack() as stack:
            def _timeout(signum, frame):
                raise TimeoutError()
            try:
                signal.signal(signal.SIGALRM, _timeout)
                signal.alarm(self._timeout)
                resp = stack.enter_context(urllib.request.urlopen(req, timeout=self._timeout))
                self._timeout = self._max
            except TimeoutError:
                self._timeout = max(int(self._timeout/2), self._min)
                raise
            except urllib.error.URLError as exception:
                if isinstance(exception.reason, socket.timeout):
                    self._timeout = max(int(self._timeout/2), self._min)
                    raise TimeoutError() from exception
                raise
            finally:
                signal.alarm(0)

            yield resp


def update_year(updated_year, url_timeout):
    url = f'https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-{updated_year}.json.gz'

    filename = f'nvdcve-1.1-{year}.json.gz'
    if os.path.exists(filename):
        try:
            with open(f"{filename}.etag", encoding="utf-8") as file:
                etag = file.read()
        except FileNotFoundError:
            etag = None
    else:
        etag = None

    request = urllib.request.Request(url)
    if etag is not None:
        request.add_header('If-None-Match', etag)
        url_opener = url_timeout.open
    else:
        url_opener = urllib.request.urlopen
    try:
        with url_opener(request) as resp:
            new_etag = resp.getheader('ETag')
            assert new_etag is not None
            with open(filename, 'wb') as file:
                while True:
                    buf = resp.read(4096)
                    if not buf:
                        print(f"Downloaded {file.name}")
                        break
                    file.write(buf)
            with open(f"{filename}.etag", "w", encoding="utf-8") as file:
                file.write(new_etag)
    except TimeoutError:
        if etag is None:
            raise
        print(f"Timeout, using cache for {filename}")
    except urllib.error.HTTPError as error:
        if error.code == 304:
            print(f"Cached {filename}")
        elif error.code == 404:
            print(f"{filename} not found")
            return
        else:
            raise

if __name__ == "__main__":
    url_timeout = UrlOpenTimeout()
    entries = []
    for year in range(2002, datetime.datetime.now().year + 1):
        update_year(str(year), url_timeout)
