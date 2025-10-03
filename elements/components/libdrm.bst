kind: meson
description: libdrm

build-depends:
- public-stacks/buildsystem-meson.bst
- components/python3-docutils.bst

depends:
- public-stacks/runtime-minimal.bst
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
  track: libdrm-*
  ref: libdrm-2.4.126-0-g22d70b6a8fb0e7a4255203a84bb4549d93314fcc
