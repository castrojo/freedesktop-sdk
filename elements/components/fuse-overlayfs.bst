kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/fuse3.bst

sources:
- kind: git_repo
  url: github:containers/fuse-overlayfs.git
  track: v*
  ref: v1.10-0-ga1e8466e2c2b46593656481508c1cf65a853e4bd
