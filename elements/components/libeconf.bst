kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:openSUSE/libeconf.git
  track: master
  ref: v0.5.2-2-g5d0fd7435ab7d34dfcf6c1dca9494dc3e7376eec
