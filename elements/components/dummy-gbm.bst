kind: meson
description: |
  This provides libgbm with out any backend. This is to be used in the
  SDK for applications to link against. It should also be in the
  platform if not GL extension loaded provides libgbm.  However if it
  is present in a GL extension, it should be loaded instead.

build-depends:
- public-stacks/buildsystem-meson.bst
  # It just needs one header from extension at build time to get a PCI ID.
- extensions/mesa/libdrm.bst
- components/python3.bst
- components/python3-mako.bst
- components/bison.bst
- components/flex.bst

depends:
- bootstrap-import.bst
- components/libdrm.bst

(@):
- elements/include/mesa.yml

environment:
  PKG_CONFIG_PATH: ":%{libdir}/GL/default/lib/pkgconfig"

variables:
  meson-local: >-
    -Db_ndebug=true
    -Dvulkan-drivers=""
    -Ddri-drivers=""
    -Dgallium-drivers=""
    -Dplatforms=""
    -Dtools=""
    -Ddri3=false
    -Degl=false
    -Dgbm=true
    -Dgles1=false
    -Dgles2=false
    -Dglx=disabled
    -Dlmsensors=false
    -Dmicrosoft-clc=disabled
    -Dosmesa=false
    -Dselinux=false
    -Dshared-glapi=false
    -Dvalgrind=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgbm.so'

config:
  install-commands:
    (>):
    - |
      rm -rf "%{install-root}%{datadir}"

sources:
  (>):
  - kind: patch
    path: patches/mesa/mesa-gbm-force-libdrm-dep.patch
