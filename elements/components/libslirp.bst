kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/sed.bst
- components/_private/git-minimal.bst

depends:
- components/glib.bst

sources:
- kind: git_repo
  url: freedesktop:slirp/libslirp.git
  track: v*
  ref: v4.9.2-0-g97b325339a1377249e68e6c58e9c15a6e1bba4c1
