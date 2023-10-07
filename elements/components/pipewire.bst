kind: filter

build-depends:
- components/pipewire-base.bst

runtime-depends:
- bootstrap-import.bst
- components/gstreamer-plugins-base.bst
- components/alsa-lib.bst
- components/libdbus.bst
- components/systemd-libs.bst
- components/pipewire-manifest.bst

config:
  exclude:
  - daemon
  include-orphans: True

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpipewire-*.so'
        - '%{libdir}/libjack*.so'
        - '%{bindir}/pw-config'
