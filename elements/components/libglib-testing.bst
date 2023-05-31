kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst

depends:
- components/glib.bst

sources:
- kind: git_repo
  url: git_https:gitlab.gnome.org/pwithnall/libglib-testing.git
  track: main
  ref: 0.1.1-6-g78b60c5262ee5c4e5e153293aa18c42f7daed9c0
