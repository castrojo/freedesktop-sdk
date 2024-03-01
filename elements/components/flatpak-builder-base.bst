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
- kind: git_tag
  url: github:flatpak/flatpak-builder.git
  track: main
  track-extra:
  - flatpak-builder-1.2.x
  match:
  - 1.[02468]*
  - 1.1[02468]*
  ref: 1.4.2-0-g0b9070037a573a6061d7893312611957561ca841
- kind: git_module
  path: subprojects/libglnx
  url: gnome:libglnx.git
  ref: 470af8763ff7b99bec950a6ae0a957c1dcfc8edd
