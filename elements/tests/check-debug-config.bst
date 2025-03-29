kind: import

config:
  target: "%{datadir}/check-debug"

sources:
- kind: local
  path: tests/check-debug/missing-debug-data-allowlist.json
