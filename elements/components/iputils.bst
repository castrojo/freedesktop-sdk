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
  ref: 20221126-0-g5ffabc4190cab975c7332645259e286a032e183b

variables:
  meson-local: >-
    -DBUILD_MANS=false
    -DBUILD_NINFOD=false
    -DSKIP_TESTS=true
