kind: meson
description: libdrm

(@):
- elements/extensions/mesa/config.yml

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-pciaccess.bst

variables:
  meson-local: >-
    -Dtegra=enabled
    -Dcairo-tests=disabled
    -Dman-pages=disabled
    -Dvalgrind=disabled
    -Dudev=false
    -Dtests=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdrm_*.so'
        - '%{libdir}/libdrm.so'

sources:
- kind: git_repo
  url: freedesktop:mesa/drm.git
  track: libdrm-*
  ref: libdrm-2.4.130-0-g523534ee018b01fb93a62d88afca1a41a732c929
