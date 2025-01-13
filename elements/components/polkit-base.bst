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
    -Dsession_tracking=logind
    -Djs_engine=duktape
  local_flags: -std=gnu++17

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
  ref: 126-0-gd627b0d1e1108563658dabe3fb8d2a065e64df10
