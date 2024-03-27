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
  ref: 1.4.3-0-g71495258a5df18367ac502b2a191f93cd7481f92
- kind: git_module
  path: subprojects/libglnx
  url: gnome:libglnx.git
  ref: 202b294e6079e23242e65e0426f8639841d1210b
