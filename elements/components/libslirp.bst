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
  ref: v4.9.4-0-gd09dc9a70360ee7838acccbd234ab83f3b9b37a5
