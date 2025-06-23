kind: autotools_recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- components/linux-pam.bst
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:legionus/kbd.git
  track: v*
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: v2.9.0-0-g5264edbf92ece130d1c559fe72ab04d24045da8f
