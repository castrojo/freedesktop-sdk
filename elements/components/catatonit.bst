kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:openSUSE/catatonit.git
  track: 'v*.*.*'
  ref: v0.1.7-0-g4045634d6255b63d285d73ffc522822a73f4bd03
- kind: patch
  path: patches/catatonit/configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
