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
  ref: v2.2.6-0-g29f9d6c79882c93d602af1eca91fbdc22631bafd
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: 3766806904396257b098d800c04c996306ff9517
