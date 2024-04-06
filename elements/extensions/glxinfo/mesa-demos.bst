kind: meson

(@): elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- public-stacks/buildsystem-autotools.bst
- components/mesa-headers.bst
- components/wayland-protocols.bst

depends:
- components/libdrm.bst
- extensions/glxinfo/freeglut.bst
- extensions/glxinfo/glu.bst

variables:
  meson-local: >-
    -Dgles1=disabled
    -Dosmesa=disabled

sources:
- kind: git_repo
  url: freedesktop:mesa/demos.git
  ref: mesa-demos-8.5.0-0-gcda7fa14b8484c716441cfb04a1b1dccec57888e
- kind: patch
  path: patches/mesa-demos/meson-Add-missing-build-dependencies-on-glu.patch
