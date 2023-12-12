kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/python3-flake8.bst
- components/valgrind-maybe.bst

depends:
- components/avahi.bst
- components/flatpak.bst
- components/gnupg.bst
- components/libsoup.bst
- components/mogwai.bst
- components/networkmanager.bst
- components/ostree.bst

sources:
- kind: git_repo
  url: github:endlessm/eos-updater.git
  track: master
  ref: Release_5.1.0-10-g50ce3cfc552f973bf4f49e9048db25f5335fb3f2

variables:
  meson-local: >-
    -Dmetrics=disabled
