kind: meson

build-depends:
- components/gtk-doc.bst
- components/gobject-introspection.bst
- public-stacks/buildsystem-meson.bst

depends:
- filename: bootstrap-import.bst
- filename: components/json-glib.bst
- filename: components/glib.bst
- filename: components/libsoup.bst

variables:
  meson-local: >-
    -D3g-source=false
    -Dcdma-source=false
    -Dmodem-gps-source=false
    -Dnmea-source=false
    -Ddemo-agent=false

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{datadir}/applications"
      rm -r "%{install-root}%{sysconfdir}/dbus-1/system.d"
      rm -r "%{install-root}%{libexecdir}"
      rm -r "%{install-root}%{datadir}/dbus-1/system-services"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{datadir}/dbus-1/interfaces/org.freedesktop.GeoClue2*'
        - '%{libdir}/libgeoclue-2.so'

sources:
- kind: git_tag
  url: freedesktop:geoclue/geoclue.git
  track: 2.5.x
  ref: 2.5.7-0-g3bb60dd600a8b247fd6049e7e5b1c73c2c5fc0e8
