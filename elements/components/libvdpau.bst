kind: meson
description: libvdpau

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst

variables:
  meson-local: >-
    -Dmoduledir=%{vdpau-dir}
    -Ddri2=true

  vdpau-dir: "%{libdir}/GL/vdpau"
  gl-default-lib: "%{libdir}/GL/default/lib"

config:
  install-commands:
    (>):
    - |
      mkdir -p %{install-root}%{gl-default-lib}
      mv %{install-root}%{vdpau-dir} %{install-root}%{gl-default-lib}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvdpau.so'
        - '%{libdir}/vdpau/libvdpau_*.so'

      extra:
      - "%{libdir}/GL"	
      - "%{libdir}/GL/**"
      

sources:
- kind: git_repo
  url: freedesktop:vdpau/libvdpau.git
  track: '*.*'
  ref: 1.5-0-g79f1506a3307d3275b0fdfb2e110c173f68e6f78
