# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- public-stacks/buildsystem-meson.bst
- components/mesa-headers.bst
- components/wayland-protocols.bst

depends:
- components/libdecor.bst
- components/libdrm.bst
- components/libxkbcommon.bst
- extensions/glxinfo/freeglut.bst
- extensions/glxinfo/glu.bst

variables:
  meson-local: >-
    -Dgles1=disabled
    -Dosmesa=disabled
    -Dvulkan=disabled

sources:
- kind: git_repo
  url: freedesktop:mesa/demos.git
  track: mesa-demos-*
  ref: mesa-demos-9.0.0-0-g661681767bfb4e8f136aac1fd7934e6b0fa46d29
