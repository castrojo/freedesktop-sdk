kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst
- components/systemd.bst
- components/vala.bst
- components/avahi.bst

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
      geoclue-license:
      - "%{project_licensedir}"
      - "%{project_licensedir}/**"

sources:
- kind: git_repo
  url: freedesktop:geoclue/geoclue.git
  track: '*.*.*'
  ref: 2.8.2-0-g97df14726a95a06e0e3f1b3c9c4388ed1aff7e8c
- kind: local
  path: files/geoclue/sysusers.conf
