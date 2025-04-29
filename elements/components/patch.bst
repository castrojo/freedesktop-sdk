kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/git-minimal.bst

depends:
- bootstrap-import.bst

variables:
  autogen: ./bootstrap --no-git --gnulib-srcdir=%{build-root}/gnulib


sources:
- kind: git_repo
  url: savannah:patch.git
  track: v*
  ref: v2.8-0-gb3d0c933389208ccac795a1b517c5a8b11cc012e
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: 9829f0a93c40492875f67ee738e000611bdcf0e7
