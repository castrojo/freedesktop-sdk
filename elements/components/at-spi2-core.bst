kind: meson

build-depends:
- components/gtk-doc.bst
- public-stacks/buildsystem-meson.bst
- components/dbus.bst

depends:
- bootstrap-import.bst
- components/libdbus.bst
- components/glib.bst

variables:
  meson-local: >-
    -Dx11=no

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatspi.so'
      (@): include/_private/exclude-systemd.yml

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'
    vendor: 'gnome'

sources:
- kind: git_repo
  url: gnome:at-spi2-core.git
  track: AT_SPI2_CORE_2_44_*
  ref: AT_SPI2_CORE_2_44_1-0-g9a1f0aec0b7dc55360310b6d02c2b7798511268f
