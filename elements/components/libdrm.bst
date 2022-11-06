kind: meson
description: libdrm

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/xorg-lib-pciaccess.bst

variables:
  meson-local: |
    -Dintel=false \
    -Dradeon=false \
    -Damdgpu=false \
    -Dnouveau=false \
    -Dvmwgfx=false \
    -Domap=false \
    -Dexynos=false \
    -Dfreedreno=false \
    -Dtegra=false \
    -Dvc4=false \
    -Detnaviv=false \
    -Dudev=false

config:
  install-commands:
    (>):
    - |
      for f in "%{install-root}%{includedir}"/libdrm/*; do
        case "${f}" in
          */drm.h) ;&
          */drm_*.h)
            ;;
          */*_drm.h)
            rm "${f}"
            ;;
          *)
            echo "Not sure what to do with ${f}" 1>&2
            false
            ;;
        esac
      done

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdrm.so'
        - '%{libdir}/libkms.so'

sources:
- kind: git_tag
  url: freedesktop:mesa/drm.git
  ref: libdrm-2.4.107-0-g9cef5dee3cd817728c83aeb3c2010c1954e4c402
