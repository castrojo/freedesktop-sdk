kind: cmake

build-depends:
- components/cmake-stage1.bst
- components/gettext.bst
- components/ninja.bst
- components/pkg-config.bst

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
  track: v*
  ref: v0.7.4-0-gb66629fe913fe73b90b4408093635787827b6485
