kind: meson

depends:
- components/libcap.bst
- components/systemd.bst

build-depends:
- public-stacks/buildsystem-meson.bst

sources:
- kind: git_tag
  url: github:iputils/iputils.git
  track: master
  ref: 20231222-0-g84cdf26908b4a03b917a5429a6339b7374fcc38b

variables:
  meson-local: >-
    -DBUILD_MANS=false
    -DSKIP_TESTS=true
