kind: script

build-depends:
- snap-images/squashfs-tools.bst
- filename: snap-images/vulkaninfo.bst
  config:
    location: '%{build-root}'

(@):
- elements/snap-images/snap-common.yml

variables:
  snap-target: vulkaninfo.snap
