kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libcap.bst

sources:
- kind: git_repo
  url: github:projectatomic/bubblewrap.git
  track: v*
  ref: v0.10.0-0-gdc63ec667e6546f34e0b6c088cdf8ae7c7dea0f3
