kind: script

build-depends:
- utils/check-static-libraries.bst
- tests/check-static-libraries-config.bst
- filename: sdk-image.bst
  config:
    location: /sysroot

config:
  commands:
  - |
    check-static-libraries /sysroot %{datadir}/static_libraries_allow_list
