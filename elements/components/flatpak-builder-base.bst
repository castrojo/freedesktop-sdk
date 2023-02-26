kind: autotools

depends:
- bootstrap-import.bst
- components/curl.bst
- components/libsoup2.bst # flatpak-builder is using both libcurl and libsoup :(
- components/libyaml.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flatpak-minimal.bst  # there's a version check during configure

runtime-depends:
- components/git.bst
- components/tar.bst
- components/gzip.bst
- components/zip.bst

variables:
  conf-local: >-
    --disable-documentation
    --with-system-debugedit

sources:
- kind: git_repo
  url: github:flatpak/flatpak-builder.git
  track: 1.[02468]*
  ref: 1.2.3-0-gd7dbc51267e83242a9fe0d5a7b5304db0ac72f4f
- kind: git_module
  path: subprojects/libglnx
  url: gnome:libglnx.git
  ref: 470af8763ff7b99bec950a6ae0a957c1dcfc8edd
