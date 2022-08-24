kind: script

build-depends:
- snap-images/squashfs-tools.bst
- filename: snap-images/platform.bst
  config:
    location: '%{build-root}'

(@):
- elements/snap-images/snap-common.yml

variables:
  snap-target: platform.snap
