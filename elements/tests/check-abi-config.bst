kind: import

config:
  target: "%{datadir}/check-abi"

sources:
- kind: local
  path: utils/abidiff-suppressions.ini
- kind: local
  path: utils/check-abi-suppressions.json
