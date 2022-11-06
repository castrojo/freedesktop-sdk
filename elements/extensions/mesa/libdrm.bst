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
    -Detnaviv=true
    -Dtegra=true
    -Dudev=false
    -Dlibdrm=false
    -Dlibkms=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdrm_*.so'

sources:
- kind: git_tag
  url: freedesktop:mesa/drm.git
  ref: libdrm-2.4.107-0-g9cef5dee3cd817728c83aeb3c2010c1954e4c402
- kind: patch
  path: patches/libdrm/libdrm-disable-libdrm.patch
