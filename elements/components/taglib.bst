kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/utf8cpp.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_TESTING=OFF
    -DBUILD_EXAMPLES=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/taglib-config'
        - '%{libdir}/libtag.so'
        - '%{libdir}/libtag_c.so'

sources:
- kind: git_repo
  url: github:taglib/taglib.git
  track: v*
  exclude:
  - "*beta*"
  ref: v2.0.2-0-ge3de03501ff66221d1f1f971022b248d5b38ba06
