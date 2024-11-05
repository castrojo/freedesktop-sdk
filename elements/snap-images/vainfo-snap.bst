kind: script

build-depends:
- components/squashfs-tools.bst
- filename: snap-images/vainfo.bst
  config:
    location: '%{build-root}'

(@):
- elements/snap-images/snap-common.yml

variables:
  snap-target: vainfo.snap
