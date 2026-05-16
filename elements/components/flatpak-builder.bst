kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/debugedit.bst
- components/curl.bst
- components/flatpak.bst
- components/fuse3.bst
- components/json-glib.bst
- components/libsoup.bst
- components/libyaml.bst
- components/docbook-xsl.bst
- components/xmlto.bst

runtime-depends:
- components/git.bst
- components/git-lfs.bst
- components/tar.bst
- components/gzip.bst
- components/libarchive.bst

variables:
  meson-local: >-
    -Dtests=false
    -Dfuse=3

sources:
- kind: git_repo
  url: github:flatpak/flatpak-builder.git
  track: 1.*[02468].*
  ref: 1.4.8-0-g70421c1586e9046470c9a788fa3f3390d5431248
- kind: git_module
  path: subprojects/libglnx
  url: gnome:libglnx.git
  ref: ccea836b799256420788c463a638ded0636b1632
