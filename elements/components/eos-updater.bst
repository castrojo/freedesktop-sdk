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
  ref: Release_6.0.7-0-gab693943203082ab01adc68751ca91c38c7c3233
