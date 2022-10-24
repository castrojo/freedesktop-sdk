kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/systemd.bst

depends:
- components/glib.bst
- components/libgudev.bst

sources:
- kind: git_tag
  url: freedesktop:hadess/iio-sensor-proxy.git
  ref: 3.3-0-g83d963b3451928a757eece79aa5b280d90e37e12
