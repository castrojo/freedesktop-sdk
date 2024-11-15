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
  ref: 20240905-0-g10b50784aae3fb75c96cdf9b1668916b49557dd5

variables:
  meson-local: >-
    -DBUILD_MANS=false
    -DSKIP_TESTS=true
