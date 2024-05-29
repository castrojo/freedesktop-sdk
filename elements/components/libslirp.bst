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
  ref: v4.8.0-0-gce314e39458223c2c42245fe536fbe1bcd94e9b1
