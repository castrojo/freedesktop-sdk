kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst

depends:
- bootstrap-import.bst
- components/pcre.bst

sources:
- kind: git_tag
  url: github:swig/swig.git
  track: master
  exclude:
  - '*beta*'
  ref: v4.1.0-0-g1e99e4fe37c0f2334b6de1c6bc3fcd3188bc2c92
