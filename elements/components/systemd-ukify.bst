kind: filter

build-depends:
- components/systemd-base.bst

runtime-depends:
- components/python3.bst
- components/python3-pefile.bst
- components/systemd-manifest.bst

config:
  include:
  - ukify
