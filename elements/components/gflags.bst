kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DLIB_INSTALL_DIR:STRING="%{lib}"

sources:
- kind: git_repo
  url: github:gflags/gflags.git
  track: v*
  ref: v2.3.1-0-g8f30ebfb2b206a8bd3a97ffe3b59009a952343e6
