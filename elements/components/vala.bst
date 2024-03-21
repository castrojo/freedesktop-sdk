kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst
- components/git-minimal.bst
- components/gobject-introspection.bst
- components/vala-bootstrap.bst

depends:
- bootstrap-import.bst
- components/glib.bst

variables:
  # vala can't find gee if build-dir is used
  build-dir: ''
  conf-local: --disable-valadoc
  make: make bootstrap

sources:
- kind: git_repo
  # See https://wiki.gnome.org/Projects/Vala for last version
  url: gnome:vala.git
  # Note for updates: Stable minor versions are even.
  track: "*.*[02468].*"
  ref: 0.56.16-0-gb6f944c4601092cad4dbb3d1e3bbbf84fa0ee000
