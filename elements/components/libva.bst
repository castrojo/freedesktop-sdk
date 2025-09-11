kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libdrm.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst
- components/xorg-lib-xfixes.bst
- components/wayland.bst

variables:
  meson-local: |
    -Ddriverdir="%{libdir}/dri:%{libdir}/dri/intel-vaapi-driver:%{libdir}/dri/nvidia-vaapi-driver:%{libdir}/GL/lib/dri" \
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
  # WARNING: Tracking must be pinned to a major.minor version on stable release.
  ref: 2.22.0-0-g217da1c28336d6a7e9c0c4cb8f1c303968a675f1
