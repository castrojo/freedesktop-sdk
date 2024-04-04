kind: meson

build-depends:
- components/gtk-doc.bst
- components/gobject-introspection.bst
- components/vala.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/json-glib.bst
- components/glib.bst
- components/libsoup.bst

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
      rm -r "%{install-root}%{datadir}/dbus-1/system.d"
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
- kind: git_repo
  url: freedesktop:geoclue/geoclue.git
  track: '*.*.*'
  ref: 2.7.1-0-g8a24f60969d4c235d9918796c38a6a9c42e10131
