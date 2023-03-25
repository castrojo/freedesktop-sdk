kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/fuse3.bst

sources:
- kind: git_tag
  url: github:containers/fuse-overlayfs.git
  track: main
  ref: v1.11-0-g68c31d14b020d0df9288d09181e9c8ca1889a967
