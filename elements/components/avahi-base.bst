kind: autotools

build-depends:
- bootstrap-import.bst
- public-stacks/buildsystem-autotools.bst
- components/dbus.bst
- components/glib.bst
- components/gtk3.bst
- components/systemd.bst

- components/libdaemon.bst
- components/pygobject.bst
- components/python3-dbus.bst
- components/xmltoman.bst

variables:
  conf-local: >-
    --with-distro=none
    --disable-libevent
    --disable-qt3
    --disable-qt4
    --disable-qt5
    --disable-gtk
    --enable-gtk3
    --disable-python
    --disable-mono

config:
  install-commands:
    (>):
    - |
      install -Dm644 -t "%{install-root}%{indep-libdir}/sysusers.d" \
                     freedesktop-sdk/avahi.conf

sources:
- kind: git_repo
  url: github:lathiat/avahi.git
  track: v*.*
  exclude:
  - '*rc*'
  ref: v0.8-0-gf060abee2807c943821d88839c013ce15db17b58
- kind: local
  path: files/avahi/avahi.conf
  directory: freedesktop-sdk

public:
  bst:
    split-rules:
      ui:
      - "%{bindir}/bssh"
      - "%{bindir}/bvnc"
      - "%{bindir}/bshell"
      - "%{libdir}/libavahi-ui-gtk3.so*"
      - "%{libdir}/pkgconfig/avahi-ui-gtk3.pc"
      - "%{debugdir}%{bindir}/bssh.debug"
      - "%{debugdir}%{libdir}/libavahi-ui-gtk3.so*.debug"
      gobject:
      - "%{includedir}/avahi-gobject"
      - "%{includedir}/avahi-gobject/**"
      - "%{libdir}/pkgconfig/avahi-gobject.pc"
      - "%{libdir}/girepository-1.0"
      - "%{libdir}/girepository-1.0/**"
      - "%{libdir}/libavahi-gobject.so*"
      - "%{datadir}/gir-1.0"
      - "%{datadir}/gir-1.0/**"
      - "%{debugdir}%{libdir}/libavahi-gobject.so*.debug"
  cpe:
    product: avahi
