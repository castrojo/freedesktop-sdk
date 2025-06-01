kind: autotools
description: jq JSON processor

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

config:
  configure-commands:
    (<):
    - |
      cd vendor/oniguruma
      autoreconf -v -f -i
      cd ../..

sources:
- kind: git_repo
  url: github:jqlang/jq.git
  track: jq-*
  exclude:
  - jq-*rc*
  ref: jq-1.8.0-0-gd23a7b9db932be706fecf5f4c9711fd4214bb64e
- kind: git_module
  path: vendor/oniguruma
  url: github:kkos/oniguruma.git
  ref: 4ef89209a239c1aea328cf13c05a2807e5c146d1
