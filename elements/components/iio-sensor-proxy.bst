kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/systemd.bst

depends:
- components/glib.bst
- components/libgudev.bst
- components/polkit.bst

sources:
- kind: git_repo
  url: freedesktop:hadess/iio-sensor-proxy.git
  track: '*.*'
  exclude:
  - '*RC*'
  ref: 3.8-0-g7fec9326aa785127d0ebaea53ba2e89d37d7bca0
