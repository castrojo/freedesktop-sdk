kind: script

build-depends:
- components/squashfs-tools.bst
- filename: snap-images/clinfo.bst
  config:
    location: '%{build-root}'

(@):
- elements/snap-images/snap-common.yml

variables:
  snap-target: clinfo.snap
