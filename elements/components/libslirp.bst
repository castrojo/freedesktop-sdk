kind: meson

(@):
- include/_private/meson-recc.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/_private/git-minimal.bst
- bootstrap/sed.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- components/glib.bst

sources:
- kind: git_repo
  url: freedesktop:slirp/libslirp.git
  track: v*
  ref: v4.9.1-0-g9c744e1e52aa0d9646ed91d789d588696292c21e
