kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:openSUSE/libeconf.git
  track: v*
  ref: v0.6.0-0-gf809899aa4a58003fd646612dbf5915d037b1f76
