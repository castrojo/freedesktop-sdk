kind: script

build-depends:
- tests/check-rpath-deps.bst
- filename: platform-image.bst
  config:
    location: /sysroot

config:
  commands:
  - |
    /utils/find-rpath.py %{gcc_triplet} /sysroot
