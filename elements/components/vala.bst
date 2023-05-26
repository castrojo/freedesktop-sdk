kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/vala-bootstrap.bst
- components/flex.bst
- components/bison.bst
- components/git-minimal.bst

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
  ref: 0.56.8-0-gebfff07a8191060ba5512c5a2a329ee45f187f70
