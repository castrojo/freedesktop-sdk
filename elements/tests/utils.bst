kind: import

config:
  target: /utils

sources:
- kind: local
  path: utils/check-static-libraries.py
- kind: local
  path: utils/scan-for-dev-files.sh
- kind: local
  path: utils/static_libraries_allow_list
