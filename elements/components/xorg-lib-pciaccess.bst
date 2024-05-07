kind: meson
description: X.org lib pciaccess

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpciaccess.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libpciaccess.git
  track: libpciaccess-*
  ref: libpciaccess-0.18.1-0-g2ec2576cabefef1eaa5dd9307c97de2e887fc347
