kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/glib.bst
- components/systemd-libs.bst
- components/libsoup.bst
- components/networkmanager.bst
- components/libgsystemservice.bst

sources:
- kind: git_repo
  url: freedesktop:pwithnall/mogwai.git
  track: '*.*.*'
  ref: 0.3.0-0-g6ec6fcb005856b44402ae6d6d6f391a53379357c
