kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/patch.bst
- components/_private/git-minimal.bst
- components/help2man.bst
- components/gnupg.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  build-dir: ''

sources:
- kind: git_repo
  url: github:rrthomas/libpaper.git
  track: 'v*'
  ref: v2.2.7-0-g81959a67c61f730179e376f2982022a97387ada7
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: 3766806904396257b098d800c04c996306ff9517
