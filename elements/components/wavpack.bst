kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libwavpack.so'

sources:
- kind: git_repo
  url: github:dbry/WavPack.git
  track: '*.*.*'
  exclude:
  - "*alpha*"
  - "*rc*"
  - "*beta*"
  - "*dirty*"
  ref: 5.9.0-0-g5803634a030e2a11dba602ba057b89cc34486c67
