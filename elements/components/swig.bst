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
  ref: rel-4.0.2-0-gefe5f181cf69975cf2fa1dcddefc29b93e4a6196
