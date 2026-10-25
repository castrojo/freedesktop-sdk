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
  ref: v4.9.6-0-g392af90207fc51dd9f9044ee9b1f963f3c851c2c
