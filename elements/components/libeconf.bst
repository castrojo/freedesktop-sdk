kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:openSUSE/libeconf.git
  track: master
  ref: v0.5.2-4-g9e9adf213476fcf0e0f57691bc69e7a0b061ce92
