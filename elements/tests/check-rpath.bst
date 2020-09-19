kind: script

build-depends:
- tests/check-rpath-deps.bst
- filename: platform-image.bst
  config:
    location: /sysroot

config:
  commands:
  - |
    %{bindir}/find-rpath.py %{gcc_triplet} /sysroot
