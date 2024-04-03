kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DLIB_INSTALL_DIR:STRING="%{lib}"

sources:
- kind: git_repo
  url: github:gflags/gflags.git
  track: v*
  ref: v2.2.2-0-ge171aa2d15ed9eb17054558e0b3a6a413bb01067
