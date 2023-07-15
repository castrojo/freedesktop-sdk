kind: import

config:
  target: "%{datadir}/check-abi"

sources:
- kind: local
  path: tests/check-abi/abidiff-suppressions.ini
- kind: local
  path: tests/check-abi/check-abi-suppressions.json
