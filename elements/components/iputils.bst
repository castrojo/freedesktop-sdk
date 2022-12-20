kind: meson

depends:
- components/libcap.bst
- components/systemd.bst

build-depends:
- public-stacks/buildsystem-meson.bst

sources:
- kind: git_repo
  url: github:iputils/iputils.git
  track: '[0-9]*'
  ref: 20211215-0-g1d1e7c43210d8af316a41cb2c53d612a4c16f34d

variables:
  meson-local: >-
    -DBUILD_MANS=false
    -DBUILD_NINFOD=false
    -DSKIP_TESTS=true
