kind: cmake

build-depends:
- components/cmake-stage1.bst
- components/gcc.bst
- components/gettext.bst
- components/ninja.bst
- components/pkg-config.bst
- components/stripper.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: v0.7.9-0-g25eb4246560e870c7e9c9a16abfb206566d98979
