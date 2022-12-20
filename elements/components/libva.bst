kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/libdrm.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst
- components/xorg-lib-xfixes.bst
- components/wayland.bst

variables:
  meson-local: |
    -Ddriverdir="%{libdir}/dri:%{libdir}/dri/intel-vaapi-driver:%{libdir}/GL/lib/dri" \
    -Dwith_glx=no \
    -Dwith_wayland=yes \
    -Dwith_x11=yes

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libva.so'
        - '%{libdir}/libva-tpi.so'
        - '%{libdir}/libva-x11.so'
        - '%{libdir}/libva-drm.so'
        - '%{libdir}/libva-wayland.so'

sources:
- kind: git_repo
  url: github:intel/libva.git
  track: '2.*.*'
  ref: 2.15.0-0-gb095d10bf355110352e75c22e581018a7ea7de5a
