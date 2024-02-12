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
  url: github:jqlang/jq.git
  track: jq-*
  exclude:
  - jq-*rc*
  ref: jq-1.7.1-0-g71c2ab509a8628dbbad4bc7b3f98a64aa90d3297
- kind: git_module
  path: modules/oniguruma
  url: github:kkos/oniguruma.git
  ref: d2f1a14ced5d5d461acac0da0d477ab240a7ab5f
