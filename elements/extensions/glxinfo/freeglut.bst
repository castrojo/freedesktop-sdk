kind: cmake

(@): elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/mesa-headers.bst
- components/xorg-lib-xi.bst

- extensions/glxinfo/glu.bst


variables:
  local_flags: -std=gnu17
  cmake-local: >
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DFREEGLUT_BUILD_DEMOS:BOOL=OFF
    -DCMAKE_C_FLAGS="${CFLAGS} -I/app/include"

sources:
- kind: git_repo
  url: github:FreeGLUTProject/freeglut.git
  track: v*
  exclude:
  - v*rc*
  ref: v3.6.0-0-g566cd459201ae29003ef5686c06506d8646e55c6
