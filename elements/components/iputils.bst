kind: meson

(@):
- include/_private/meson-recc.yml

depends:
- components/libcap.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst
- (@): include/_private/gcc-for-recc.yml

sources:
- kind: git_repo
  url: github:iputils/iputils.git
  track: '[0-9]*'
  ref: 20250605-0-g6e1cb146547eb6fbb127ffc8397a9241be0d33c2

variables:
  meson-local: >-
    -DBUILD_MANS=false
    -DSKIP_TESTS=true
