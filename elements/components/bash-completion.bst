kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:scop/bash-completion.git
  track: '*.*'
  ref: 2.16.0-0-g79d225bad8939a3833314b5af93509131c03f2f8
