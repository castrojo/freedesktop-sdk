kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/fuse3.bst

sources:
- kind: git_repo
  url: github:containers/fuse-overlayfs.git
  track: v*
  ref: v1.15-0-gc5f3ef142e46b382f13c5fd0cfa5cf53b26954f7
