kind: script

build-depends:
- tests/check-static-libraries-deps.bst
- filename: sdk-image.bst
  config:
    location: /sysroot

config:
  commands:
  - |
    python3 /utils/check-static-libraries.py /sysroot /utils/static_libraries_allow_list
