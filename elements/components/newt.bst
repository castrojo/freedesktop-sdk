kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/slang.bst
- components/popt.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: pagure:newt.git
  track: master
  ref: r0-52-22-0-g7d7e516c9f4fee6e0bea91ace73a45ce0965e436
