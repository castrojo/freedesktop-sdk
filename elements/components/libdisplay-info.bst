kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/hwdata.bst

sources:
- kind: git_repo
  track: '*.*.*'
  url: freedesktop:emersion/libdisplay-info.git
  ref: 0.2.0-0-g66b802d05b374cd8f388dc6ad1e7ae4f08cb3300
