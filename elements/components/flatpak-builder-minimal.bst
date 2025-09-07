kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/curl.bst
- components/flatpak-minimal.bst
- components/fuse3.bst
- components/json-glib.bst
- components/libsoup.bst
- components/libyaml.bst

runtime-depends:
- components/git.bst
- components/tar.bst
- components/gzip.bst
- components/libarchive.bst

variables:
  meson-local: >-
    -Ddocs=disabled
    -Dtests=false
    -Dfuse=3

(@):
- elements/include/flatpak-builder-source.yml
