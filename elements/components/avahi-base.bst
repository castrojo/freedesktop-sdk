kind: autotools

build-depends:
- public-stacks/runtime-minimal.bst
- public-stacks/buildsystem-autotools.bst
- components/dbus.bst
- components/glib.bst
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
    --disable-gtk3
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
      libs:
      - "%{includedir}/avahi-client"
      - "%{includedir}/avahi-client/**"
      - "%{includedir}/avahi-common"
      - "%{includedir}/avahi-common/**"
      - "%{libdir}/pkgconfig/avahi-client.pc"
      - "%{libdir}/libavahi-client.so*"
      - "%{libdir}/libavahi-common.so*"
      - "%{debugdir}%{libdir}/libavahi-client.so*.debug"
      - "%{debugdir}%{libdir}/libavahi-common.so*.debug"
      - "%{sourcedir}/%{element-name}/avahi-client"
      - "%{sourcedir}/%{element-name}/avahi-client/**"
      - "%{sourcedir}/%{element-name}/avahi-common"
      - "%{sourcedir}/%{element-name}/avahi-common/**"
      ui:
      - "%{bindir}/bssh"
      - "%{bindir}/bvnc"
      - "%{bindir}/bshell"
      - "%{debugdir}%{bindir}/bssh.debug"
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
    ignored:
    - CVE-2021-26720
