kind: script

build-depends:
- utils/check-debug-crc.bst
- filename: sdk-image.bst
  config:
    location: /sysroot

config:
  commands:
  - |
    check-debug-crc /sysroot
