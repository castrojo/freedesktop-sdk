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
  track: 'v*.*.*'
  ref: v1.91.3-0-g3dc5323bf9f8f84b0a038f5f36c34d49e480ee3c
