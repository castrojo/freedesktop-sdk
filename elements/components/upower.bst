kind: meson

build-depends:
- components/gtk-doc.bst
- components/systemd.bst
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gobject-introspection.bst
- components/libgudev.bst
- components/libimobiledevice.bst
- components/libusb.bst
- components/polkit-gobject.bst

sources:
- kind: git_repo
  url: freedesktop:upower/upower.git
  track: 'v*'
  ref: v1.91.2-0-g17f9e8dc5a967fde13be688634a465c71fb79dd0
