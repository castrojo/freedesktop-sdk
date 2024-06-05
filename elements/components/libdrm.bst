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
  track: libdrm-*
  ref: libdrm-2.4.121-0-g70c4f836ccffa972978bc58c9cc0434f85984be8
- kind: patch
  path: patches/libdrm/libdrm-do-not-break-abi.patch
