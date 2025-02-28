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

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdrm.so'

sources:
- kind: git_repo
  url: freedesktop:mesa/drm.git
  # On release branches, we need to lock it to a specific version.
  track: libdrm-2.4.124
  ref: libdrm-2.4.124-0-g38ec7dbd4df3141441afafe5ac62dfc9df36a77e
