kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:swig/swig.git
  track: v*
  ref: v4.1.0-0-g1e99e4fe37c0f2334b6de1c6bc3fcd3188bc2c92
