kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst

depends:
- components/glib.bst
- components/polkit.bst
- components/systemd.bst

sources:
- kind: git_repo
  url: git_https:gitlab.gnome.org/pwithnall/libgsystemservice.git
  track: '*.*'
  ref: 0.3.0-0-gf4c5764652b5f347347b459ee011e4f02b29c3a0
