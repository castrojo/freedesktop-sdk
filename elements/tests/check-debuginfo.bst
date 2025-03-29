kind: script

build-depends:
- utils/check-debug-crc.bst
- tests/check-debug-config.bst
- filename: sdk-image.bst
  config:
    location: /sysroot

config:
  commands:
  - |
    check-debug-crc --ignore-file "%{datadir}/check-debug/missing-debug-data-allowlist.json" /sysroot
