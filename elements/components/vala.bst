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
- kind: git_tag
  # See https://wiki.gnome.org/Projects/Vala for last version
  url: gnome:vala.git
  track: master
  track-extra:
  - '0.56'
  # Note for updates: Stable minor versions are even.
  match:
  - "*.*[02468].*"
  ref: 0.56.14-0-gc36a694d9bf09b622aac7f9b9e0af70c966b721e
