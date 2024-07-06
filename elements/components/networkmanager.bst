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
  ref: 1.48.4-0-g62a0fa9fcbdd7ee907f9a00e2543a4a9f997b5ae
