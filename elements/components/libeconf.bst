kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:openSUSE/libeconf.git
  track: v*
  ref: v0.6.3-0-g417114859b8cff6a3818e22c90397ac7798c94be
