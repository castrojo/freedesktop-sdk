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
  ref: 20211215-0-g1d1e7c43210d8af316a41cb2c53d612a4c16f34d

variables:
  meson-local: >-
    -DBUILD_RARPD=true
    -DBUILD_TFTPD=true
    -DBUILD_TRACEROUTE6=true
    -DBUILD_MANS=false
    -DBUILD_NINFOD=false
    -DSKIP_TESTS=true
