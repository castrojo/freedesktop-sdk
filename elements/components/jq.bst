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
- kind: git_tag
  url: github:stedolan/jq.git
  track: master
  exclude:
  - '*rc*'
  ref: jq-1.7-0-g11c528d04d76c9b9553781aa76b073e4f40da008
- kind: git_module
  path: modules/oniguruma
  url: github:kkos/oniguruma.git
  ref: d2f1a14ced5d5d461acac0da0d477ab240a7ab5f
