kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  autogen: ./bootstrap --no-git --gnulib-srcdir=%{build-root}/gnulib


sources:
- kind: git_repo
  url: savannah:patch.git
  track: v*
  ref: v2.8-0-g48ceda8200aaf30c3ce42c31cd70ff6087db2425
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: 9829f0a93c40492875f67ee738e000611bdcf0e7
