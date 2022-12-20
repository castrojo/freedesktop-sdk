kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  conf-cmd: mingw-w64-tools/genpeimg/configure

sources:
- kind: git_repo
  url: sourceforge_git:mingw-w64/mingw-w64.git
  track: v*
  ref: v10.0.0-0-gaa08f56da559016f10336dddca85d59f9bdc9e02
