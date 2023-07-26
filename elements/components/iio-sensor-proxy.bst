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
  ref: 3.5-0-g29c79c9e3bd325c481bd9c52fdd520665bc0e28b
