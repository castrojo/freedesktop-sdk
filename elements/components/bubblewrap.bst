kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libcap.bst

sources:
- kind: git_tag
  url: github:projectatomic/bubblewrap.git
  track: main
  ref: v0.9.0-0-g8e51677abd7e3338e4952370bf7d902e37d8cbb6
