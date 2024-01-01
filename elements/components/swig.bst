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
  ref: v4.2.0-0-gd65157602d53d08c2fad5c362f66c8c0cae7a4f4
