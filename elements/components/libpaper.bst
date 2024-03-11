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
  ref: v2.2.3-0-g691a462a6ad1c2aed2fbb2475624b60625d4e76a
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: f2b8ad906cbc861552a64e3804e5851c323cbac7
