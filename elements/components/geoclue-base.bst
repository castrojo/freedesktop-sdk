kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst
- components/systemd.bst
- components/vala.bst
- components/avahi.bst

depends:
- components/json-glib.bst
- components/glib.bst
- components/libsoup.bst
- components/avahi-gobject.bst

variables:
  # FIXME: Need modem-manager
  meson-local: >-
    -D3g-source=false
    -Dcdma-source=false
    -Dmodem-gps-source=false
    -Ddemo-agent=false

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{libexecdir}/geoclue-2.0/demos"
      rm "%{install-root}%{datadir}/applications/geoclue-where-am-i.desktop"

    - |
      sysusersdir="$(pkg-config --variable=sysusersdir systemd)"
      install -Dm644 sysusers.conf "%{install-root}${sysusersdir}/geoclue.conf"

public:
  cpe:
    product: geoclue
  bst:
    split-rules:
      libgeoclue:
      - '%{includedir}'
      - '%{includedir}/**'
      - '%{libdir}/libgeoclue*.so*'
      - '%{debugdir}/dwz'
      - '%{debugdir}/dwz/**'
      - '%{debugdir}/source'
      - '%{debugdir}/source/**'
      - '%{debugdir}%{libdir}'
      - '%{debugdir}%{libdir}/**'
      - '%{libdir}/pkgconfig/libgeoclue*.pc'
      - '%{libdir}/girepository-*'
      - '%{libdir}/girepository-*/**'
      - '%{datadir}/gir-*'
      - '%{datadir}/gir-*/**'
      - '%{datadir}/gtk-doc/html/libgeoclue'
      - '%{datadir}/gtk-doc/html/libgeoclue/**'
      - '%{datadir}/vala'
      - '%{datadir}/vala/**'

sources:
- kind: git_repo
  url: freedesktop:geoclue/geoclue.git
  track: '*.*.*'
  ref: 2.7.1-0-g8a24f60969d4c235d9918796c38a6a9c42e10131
- kind: local
  path: files/geoclue/sysusers.conf
