kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:scop/bash-completion.git
  track: '*.*'
  ref: 2.14.0-0-g0543d1a28ce3d36741675c7ef6da7c2286288f3e
