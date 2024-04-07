kind: script

build-depends:
- tests/check-debug-crc.bst
- filename: sdk.bst
  config:
    location: /sysroot

config:
  commands:
  - |
    check-debug-crc /sysroot
