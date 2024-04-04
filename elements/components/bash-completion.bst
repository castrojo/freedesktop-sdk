kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:scop/bash-completion.git
  track: '*.*.*'
  ref: 2.12.0-0-g88587c871a8519d2d628d3e46d59ca34e09330b0
