kind: import

config:
  target: /utils

sources:
- kind: local
  path: utils/abidiff-suppressions.ini
- kind: local
  path: utils/check-abi
- kind: local
  path: utils/check-abi-suppressions.json
- kind: local
  path: utils/check-static-libraries.py
- kind: local
  path: utils/find-rpath.py
- kind: local
  path: utils/scan-for-dev-files.sh
- kind: local
  path: utils/static_libraries_allow_list

