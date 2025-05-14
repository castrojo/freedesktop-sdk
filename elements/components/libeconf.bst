kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libeconf.so'

sources:
- kind: git_repo
  url: github:openSUSE/libeconf.git
  ref: v0.7.4-0-gb66629fe913fe73b90b4408093635787827b6485
