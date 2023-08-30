kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/fuse3.bst

sources:
- kind: git_tag
  url: github:containers/fuse-overlayfs.git
  track: main
  ref: v1.13-0-g6931a9c088d0b110f41021e89073d6db83871a05
