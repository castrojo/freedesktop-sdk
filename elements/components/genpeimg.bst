kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  conf-cmd: mingw-w64-tools/genpeimg/configure

sources:
- kind: git_tag
  url: sourceforge_git:mingw-w64/mingw-w64.git
  track: master
  track-extra:
  - v7.x
  ref: v11.0.0-0-gf9500e2d85b9400c0982518663660a127e1dc61a
