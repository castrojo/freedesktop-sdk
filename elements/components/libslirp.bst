kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/sed.bst
- components/git-minimal.bst

depends:
- components/glib.bst

sources:
- kind: git_repo
  url: freedesktop:slirp/libslirp.git
  track: v*
  ref: v4.9.7-0-gce12dcddf710a71dc0de6450ec95edbadf8e9f66
