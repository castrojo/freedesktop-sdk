kind: cmake

(@):
- include/_private/cmake-recc.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/utf8cpp.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst

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
  ref: v2.2.1-0-g78298769de7485850613b0589d70503b8a8fc81c
