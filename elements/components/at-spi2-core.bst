kind: meson

build-depends:
- components/gtk-doc.bst
- public-stacks/buildsystem-meson.bst
- components/dbus.bst
- components/gobject-introspection.bst

depends:
- bootstrap-import.bst
- components/libdbus.bst
- components/glib.bst

variables:
  meson-local: >-
    -Dx11=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatk-1.0.so'
        - '%{libdir}/libatk-bridge-2.0.so'
        - '%{libdir}/libatspi.so'
      (@): include/_private/exclude-systemd.yml

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'
    vendor: 'gnome'

sources:
- kind: git_repo
  url: gnome:at-spi2-core.git
  track: AT_SPI2_CORE_2_*[02468]_*
  ref: AT_SPI2_CORE_2_48_4-0-gebfda3a63fc351f977d5428b1e7e1979c8edb5c5
