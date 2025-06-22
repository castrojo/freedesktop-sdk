kind: script

(@):
- elements/snap-images/snap-common.yml

build-depends:
- components/squashfs-tools.bst
- filename: snap-images/glxinfo.bst
  config:
    location: '%{build-root}'

variables:
  snap-target: glxinfo.snap
