kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:openSUSE/libeconf.git
  track: master
  ref: v0.5.2-3-gccc71d4294157dceff33c82a61e04f55f34d4efc
