kind: autotools
description: X.org lib xcb

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-proto-xcb.bst
- filename: components/xorg-util-macros.bst
  type: build
- filename: components/xorg-lib-xau.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/python3.bst
  type: build

variables:
  conf-local: |
    --enable-xkb \
    --disable-xprint

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-xvmc.so'
        - '%{libdir}/libxcb-res.so'
        - '%{libdir}/libxcb-shm.so'
        - '%{libdir}/libxcb-dri2.so'
        - '%{libdir}/libxcb.so'
        - '%{libdir}/libxcb-composite.so'
        - '%{libdir}/libxcb-sync.so'
        - '%{libdir}/libxcb-screensaver.so'
        - '%{libdir}/libxcb-xtest.so'
        - '%{libdir}/libxcb-glx.so'
        - '%{libdir}/libxcb-record.so'
        - '%{libdir}/libxcb-xv.so'
        - '%{libdir}/libxcb-damage.so'
        - '%{libdir}/libxcb-shape.so'
        - '%{libdir}/libxcb-dpms.so'
        - '%{libdir}/libxcb-xf86dri.so'
        - '%{libdir}/libxcb-render.so'
        - '%{libdir}/libxcb-xfixes.so'
        - '%{libdir}/libxcb-dri3.so'
        - '%{libdir}/libxcb-randr.so'
        - '%{libdir}/libxcb-xinerama.so'
        - '%{libdir}/libxcb-present.so'
        - '%{libdir}/libxcb-xkb.so'
        - '%{libdir}/libxcb-xinput.so'
  cpe:
    product: libxcb

config:
  configure-commands:
    (<):
    - |
      autoreconf -ivf

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxcb.git
  ref: libxcb-1.15-0-gc2c4a2cd1947e559718acdba19ef6e7db731dbeb
