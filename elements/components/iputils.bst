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
  ref: 20221126-0-g5ffabc4190cab975c7332645259e286a032e183b

variables:
  meson-local: >-
    -DBUILD_RARPD=true
    -DBUILD_TFTPD=true
    -DBUILD_TRACEROUTE6=true
    -DBUILD_MANS=false
    -DBUILD_NINFOD=false
    -DSKIP_TESTS=true
