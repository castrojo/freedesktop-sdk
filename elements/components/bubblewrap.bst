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
  ref: v0.6.2-0-gc54bbc6d7b78e7a45016efe0c4ac8af9d209aa20
