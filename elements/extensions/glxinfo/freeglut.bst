kind: cmake

(@): elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/mesa-headers.bst
- components/xorg-lib-xi.bst

- extensions/glxinfo/glu.bst


variables:
  cmake-local: >
    -DFREEGLUT_BUILD_DEMOS:BOOL=OFF
    -DCMAKE_C_FLAGS="${CFLAGS} -I/app/include"

sources:
- kind: git_repo
  url: github:FreeGLUTProject/freeglut.git
  track: v*
  exclude:
  - v*rc*
  ref: v3.4.0-0-g63c0e78d84ecbfcf8accd8bac04404427899053b
