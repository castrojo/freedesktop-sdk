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
  ref: v0.8.0-0-g4ab175fe6d3a4053444b04d805a6d686f53455b9
