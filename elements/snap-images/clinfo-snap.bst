kind: script

(@):
- elements/snap-images/snap-common.yml

build-depends:
- components/squashfs-tools.bst
- filename: snap-images/clinfo.bst
  config:
    location: '%{build-root}'

variables:
  snap-target: clinfo.snap
