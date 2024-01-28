kind: meson
description: libdrm

build-depends:
- public-stacks/buildsystem-meson.bst
- components/python3-docutils.bst

depends:
- bootstrap-import.bst
- components/xorg-lib-pciaccess.bst

variables:
  meson-local: >-
    -Dintel=disabled
    -Dradeon=disabled
    -Damdgpu=disabled
    -Dnouveau=disabled
    -Dvmwgfx=disabled
    -Domap=disabled
    -Dexynos=disabled
    -Dfreedreno=disabled
    -Dtegra=disabled
    -Dvc4=disabled
    -Detnaviv=disabled
    -Dcairo-tests=disabled
    -Dvalgrind=disabled
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

sources:
- kind: git_repo
  url: freedesktop:mesa/drm.git
  ref: libdrm-2.4.117-0-g5254fd1146b95a86fef1bb8e950d0146d829f3c4
