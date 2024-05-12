kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/perl-xml-parser.bst
- components/gobject-introspection.bst
- components/strace.bst
- components/systemd.bst

depends:
- components/glib.bst
- components/duktape.bst
- components/linux-pam.bst
- components/systemd-libs.bst

variables:
  meson-local: >-
    -Dsession_tracking=libsystemd-login
    -Djs_engine=duktape
  local_flags: -std=gnu++17

environment:
  XDG_DATA_DIRS: "%{datadir}:%{install-root}%{datadir}"

config:
  install-commands:
    (>):
    - |
      SYSUSERSDIR=$(pkg-config --variable sysusersdir systemd)
      install -D -m 644 extra/sysusers.conf %{install-root}/$SYSUSERSDIR/polkit.conf

public:
  cpe:
    product: polkit
  bst:
    split-rules:
      polkit-gobject:
      - '%{includedir}/polkit-1/polkit'
      - '%{includedir}/polkit-1/polkit/**'
      - '%{datadir}/gettext'
      - '%{datadir}/gettext/**'
      - '%{libdir}/libpolkit-gobject-1.so*'
      - '%{libdir}/pkgconfig/polkit-gobject-1.pc'
      - '%{libdir}/girepository-1.0/Polkit-1.0.typelib'
      - '%{datadir}/gir-1.0/Polkit-1.0.gir'

sources:
- kind: git_repo
  url: github:polkit-org/polkit.git
  track: '[0-9]*'
  ref: 124-0-g82f0924dc0eb23b9df68e88dbaf9e07c81940a5a
- kind: local
  path: files/polkit/sysusers.conf
  directory: extra
