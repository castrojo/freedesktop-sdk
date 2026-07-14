# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

(@):
- elements/extensions/include/app.yml

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
  ref: v3.8.0-0-g3db1649ce1f5e42f1338b51e3fa14849be547d5d
