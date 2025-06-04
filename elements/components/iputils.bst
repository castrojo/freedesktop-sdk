kind: meson

depends:
- components/libcap.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst

sources:
- kind: git_repo
  url: github:iputils/iputils.git
  track: '[0-9]*'
  ref: 20250602-0-g23b06385444fba29c898370ae6f297e41c11667b

variables:
  meson-local: >-
    -DBUILD_MANS=false
    -DSKIP_TESTS=true
