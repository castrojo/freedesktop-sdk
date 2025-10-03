kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/perl.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst
- components/wayland-protocols.bst

depends:
- public-stacks/runtime-minimal.bst
- components/at-spi2-core.bst
- components/cairo.bst
- components/cups.bst
- components/gdk-pixbuf.bst
- components/gsettings-desktop-schemas.bst
- components/hicolor-icon-theme.bst
- components/libepoxy.bst
- components/libxkbcommon.bst
- components/pango.bst
- components/wayland.bst
- components/xorg-lib-xcomposite.bst
- components/xorg-lib-xcursor.bst
- components/xorg-lib-xdamage.bst
- components/xorg-lib-xinerama.bst
- components/xorg-lib-xi.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/gtk3-*'
        - '%{bindir}/gtk-builder-tool'
        - '%{bindir}/gtk-query-settings'
        - '%{bindir}/gtk-encode-symbolic-svg'
        - '%{libdir}/libgdk-3.so'
        - '%{libdir}/libgtk-3.so'
        - '%{libdir}/libgailutil-3.so'
        - '%{datadir}/icons'
        - '%{datadir}/icons/**'
        - '%{datadir}/gtk-3.0/valgrind'
        - '%{datadir}/gtk-3.0/valgrind/**'
        - '%{datadir}/applications'
        - '%{datadir}/applications/**'

    integration-commands:
    - |
      gtk-query-immodules-3.0 --update-cache

    - |
      gtk-update-icon-cache %{datadir}/icons/hicolor
  cpe:
    product: gtk+

sources:
- kind: git_repo
  url: gnome:gtk.git
  track: 3.24.*
  ref: 3.24.51-0-g0d3e55cf22abc81b532a3011462b3195f1480974
