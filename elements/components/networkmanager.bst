kind: meson

build-depends:
- components/gobject-introspection.bst
- components/libxslt.bst
- components/perl.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/util-linux-full.bst
- components/systemd.bst
- components/dbus.bst
- components/glib.bst
- components/gnutls.bst
- components/nss.bst
- components/libpsl.bst
- components/curl.bst
- components/pygobject.bst
- components/libndp.bst
- components/audit.bst
- components/jansson.bst
- components/newt.bst
- components/polkit.bst

variables:
  meson-local: >-
    -Diwd=true
    -Dpolkit=true
    -Dppp=false
    -Dmodem_manager=false
    -Dqt=false

sources:
- kind: git_repo
  url: freedesktop:NetworkManager/NetworkManager.git
  track: '*.*.*'
  exclude:
  - "*-dev*"
  - "*-rc*"
  ref: 1.44.2-0-g8bee6ef894a27ffc8a464df3b32b03e811e1a15d
