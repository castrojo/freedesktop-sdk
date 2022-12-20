kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/git-minimal.bst

depends:
- components/glib.bst

sources:
- kind: git_repo
  url: freedesktop:slirp/libslirp.git
  track: v*
  ref: v4.7.0-0-g3ad1710a96678fe79066b1469cead4058713a1d9
