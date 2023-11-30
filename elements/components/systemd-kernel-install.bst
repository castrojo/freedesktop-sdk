kind: filter

build-depends:
- components/systemd-base.bst

runtime-depends:
- components/systemd.bst
- components/systemd-ukify.bst
- components/systemd-manifest.bst

config:
  include:
  - kernel-install
