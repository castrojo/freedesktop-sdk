kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/perl.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst

depends:
- bootstrap-import.bst
- components/atk.bst
- components/at-spi2-atk.bst
- components/cairo.bst
- components/gdk-pixbuf.bst
- components/gsettings-desktop-schemas.bst
- components/hicolor-icon-theme.bst
- components/libepoxy.bst
- components/libxkbcommon.bst
- components/pango.bst
- components/wayland.bst
- components/wayland-protocols.bst
- components/xorg-lib-xcomposite.bst
- components/xorg-lib-xcursor.bst
- components/xorg-lib-xdamage.bst
- components/xorg-lib-xinerama.bst
- components/xorg-lib-xi.bst

variables:
  conf-local: |
    --enable-xkb \
    --enable-xinerama \
    --enable-xrandr \
    --enable-xfixes \
    --enable-xcomposite \
    --enable-xdamage \
    --enable-x11-backend \
    --enable-wayland-backend

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/gtk3-*'
        - '%{bindir}/gtk-builder-tool'
        - '%{bindir}/gtk-encode-symbolic-svg'
        - '%{libdir}/libgdk-3.so'
        - '%{libdir}/libgtk-3.so'
        - '%{libdir}/libgailutil-3.so'
        - '%{datadir}/share/icons'
        - '%{datadir}/share/icons/**'

    integration-commands:
    - |
      gtk-query-immodules-3.0 --update-cache

    - |
      gtk-update-icon-cache %{datadir}/icons/hicolor
  cpe:
    product: gtk+

sources:
- kind: git_tag
  url: gnome:gtk.git
  track: gtk-3-24
  ref: 3.24.35-0-g14cf55f98ddd71ad3f91487eda1c7f14d67de119
