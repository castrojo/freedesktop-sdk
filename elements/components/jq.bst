kind: autotools_recc
description: jq JSON processor

build-depends:
- public-stacks/buildsystem-autotools.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

config:
  configure-commands:
    (<):
    - |
      cd vendor/oniguruma
      autoreconf -v -f -i
      cd ../..

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libjq.so'
        - '%{libdir}/libonig.so'
        - '%{bindir}/onig-config'

sources:
- kind: git_repo
  url: github:jqlang/jq.git
  track: jq-*
  exclude:
  - jq-*rc*
  ref: jq-1.8.1-0-g4467af7068b1bcd7f882defff6e7ea674c5357f4
- kind: git_module
  path: vendor/oniguruma
  url: github:kkos/oniguruma.git
  ref: 4ef89209a239c1aea328cf13c05a2807e5c146d1
