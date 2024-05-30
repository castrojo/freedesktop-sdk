kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:containers/composefs.git
  track: v*
  ref: v1.0.4-0-g7623e4dc89f62ada5724d4e41d0a16d2671312f5
