kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:openSUSE/catatonit.git
  track: 'v*.*.*'
  ref: v0.2.0-0-g7f0c9bb45d3490c3e7f579833c9b0689f78c8923
