kind: autotools-recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:scop/bash-completion.git
  track: '*.*'
  ref: 2.17.0-0-g47cc2eb87af2f95bc3a6b13ccebe6bd39b1b107a
