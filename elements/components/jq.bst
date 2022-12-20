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
      cd modules/oniguruma
      autoreconf -v -f -i
      cd ../..

sources:
- kind: git_repo
  url: github:stedolan/jq.git
  track: jq-*
  exclude:
  - jq-*rc*
  ref: jq-1.6-0-g2e01ff1fb69609540b2bdc4e62a60499f2b2fb8e
- kind: git_module
  path: modules/oniguruma
  url: github:kkos/oniguruma.git
  ref: 6fa38f4084b448592888ed9ee43c6e90a46b5f5c
