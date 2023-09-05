kind: autotools

depends:
- public-stacks/runtime-minimal.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_repo
  url: fdsdk_mirror:libdaemon/libdaemon.git
  track: v*
  ref: v0.14-0-g9fcc28e0e8f84968d1fb8b6d544a42efb13803ec
