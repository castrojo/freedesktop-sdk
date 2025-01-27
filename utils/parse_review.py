#!/usr/bin/env python3

"""This tool runs review-tools.snap-review and parses its output.
Every error that is because it requires a manual review from the snap
store is ignored for the return status.
"""

import json
import subprocess
import sys

has_error = False

child_process = subprocess.run(
    ["snap-review", "--json", sys.argv[1]], text=True, capture_output=True
)

if child_process.returncode == 1:
    sys.stderr.write(f"review-tools.snap-review crashed ({child_process.returncode})\n")
    sys.stderr.write(child_process.stdout)
    sys.stderr.write(child_process.stderr)
    sys.exit(1)
elif child_process.returncode == 0:
    sys.stderr.write(f"No error found ({child_process.returncode})\n")
elif child_process.returncode in [2, 3]:
    sys.stderr.write(f"Some issues found. Processing... ({child_process.returncode})\n")
else:
    sys.stderr.write(f"Unknown return code ({child_process.returncode})\n")
    sys.exit(1)

data = json.loads(child_process.stdout)
for section, section_value in data.items():
    for error, error_value in section_value["error"].items():
        if error_value["manual_review"]:
            sys.stderr.write(
                f'{section}:{error}: (MANUAL REVIEW) {error_value["text"]}\n'
            )
        else:
            sys.stderr.write(f'{section}:{error}: (ERROR) {error_value["text"]}\n')
            has_error = True
    for warning, warning_value in section_value["warn"].items():
        sys.stderr.write(f'{section}:{warning}: (WARNING) {warning_value["text"]}\n')
    for info, info_value in section_value["info"].items():
        sys.stderr.write(f'{section}:{info}: (INFO) {info_value["text"]}\n')

if has_error:
    sys.exit(1)
else:
    sys.exit(0)
