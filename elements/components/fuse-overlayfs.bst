kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/fuse3.bst

sources:
- kind: git_repo
  url: github:containers/fuse-overlayfs.git
  track: v*
  ref: v1.14-0-g33cb788edc05f5e3cbb8a7a241f5a04bee264730
