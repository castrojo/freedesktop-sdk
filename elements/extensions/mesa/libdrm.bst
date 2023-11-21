kind: meson
description: libdrm

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/xorg-lib-pciaccess.bst
- components/libdrm.bst

(@):
- elements/extensions/mesa/config.yml

variables:
  meson-local: >-
    -Dtegra=enabled
    -Dcairo-tests=disabled
    -Dman-pages=disabled
    -Dvalgrind=disabled
    -Dudev=false
    -Dtests=false
    -Dlibdrm=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdrm_*.so'

sources:
- kind: git_repo
  url: freedesktop:mesa/drm.git
  track: libdrm-*
  ref: libdrm-2.4.118-0-g02a41cf302a69f0cd94aae96ec01d98b9398076e
- kind: patch
  path: patches/libdrm/libdrm-disable-libdrm.patch
