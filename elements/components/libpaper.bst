kind: autotools-recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/gnupg.bst
- components/help2man.bst
- components/patch.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
