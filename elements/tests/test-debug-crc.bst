kind: script

build-depends:
- tests/check-debug-crc.bst
- sdk.bst

config:
  layout:
  - element: tests/check-debug-crc.bst
    destination: /
  - element: sdk.bst
    destination: /sysroot

  commands:
  - |
    check-debug-crc /sysroot
