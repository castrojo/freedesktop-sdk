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
  track: '*.*.*'
  ref: 0.2.0-0-gbb53a665a769dadb85d2e1197572ee7fe919f56d
