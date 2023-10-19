kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/patch.bst
- components/git-minimal.bst
- components/help2man.bst
- components/gnupg.bst

depends:
- bootstrap-import.bst

variables:
  build-dir: ''

sources:
- kind: git_repo
  url: github:rrthomas/libpaper.git
  track: 'v*'
  ref: v2.1.2-0-gc1a157b863fc210ef12735e6b9f576597b1083a8
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: f2b8ad906cbc861552a64e3804e5851c323cbac7
