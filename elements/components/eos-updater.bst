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
  # Updates frozen, use 23.08 for VM's
  ref: Release_4.0.14-0-gac2dd3856c04aef3c12f084fa61dc7b52814d5f3
- kind: patch
  path: patches/eos-updater/eos-updater-disable-tests.patch
