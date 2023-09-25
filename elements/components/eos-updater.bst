kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/valgrind-maybe.bst

depends:
- components/avahi.bst
- components/eos-metrics.bst
- components/flatpak.bst
- components/gnupg.bst
- components/libsoup2.bst
- components/mogwai.bst
- components/networkmanager.bst
- components/ostree.bst

sources:
- kind: git_repo
  url: github:endlessm/eos-updater.git
  track: Release_*
  ref: Release_5.0.6-0-g56883cf594d5ee3c5a790fe389fdcb35297c03ef
- kind: patch
  path: patches/eos-updater/eos-updater-disable-tests.patch
