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
  ref: v11.0.1-0-gc3e587c067a00a561899d49d3e63a659e38802ec
