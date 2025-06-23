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
  url: netfilter:libmnl
  track: libmnl-*
  ref: libmnl-1.0.5-0-g493aacf2ec9cc61a5b30d77cd55ec248f033bc74
