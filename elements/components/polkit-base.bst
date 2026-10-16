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
  local_flags: -std=gnu++17

public:
  cpe:
    product: polkit
    version-match: '\d+'
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
  ref: 128-0-ge6373dc19975d8583568c6cd7025d03e682ca956
  version-guess-pattern: '\d+'
