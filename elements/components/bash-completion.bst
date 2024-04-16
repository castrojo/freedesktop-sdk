kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:scop/bash-completion.git
  track: '*.*.*'
  ref: 2.13.0-0-g81b0f8c4dfafd6219c95ffa1defad7ff34394b0f
