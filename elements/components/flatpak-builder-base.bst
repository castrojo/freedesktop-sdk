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
  ref: 1.4.0-0-g7d621d6eec7fe523c68d46f3853cdc86561b5637
- kind: git_module
  path: subprojects/libglnx
  url: gnome:libglnx.git
  ref: 07e3e49d3e47dfd4265ffb5495111439131715ca
