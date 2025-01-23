kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/grep.bst
- bootstrap/sed.bst
- components/gobject-introspection.bst
- components/libxslt.bst
- components/perl.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst
- components/util-linux-full.bst
- components/systemd-libs.bst
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
    -Dtests=no

sources:
- kind: git_repo
  url: freedesktop:NetworkManager/NetworkManager.git
  track: '*.*.*'
  exclude:
  - "*-dev*"
  - "*-rc*"
  ref: 1.50.2-0-gff5e28e0c88d1857140be09266a2e970b34adb4f
