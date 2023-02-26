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
  ref: 3.4-0-gcd6d5e653ef33f6e824e2f7f2ee61e330d4932ac
