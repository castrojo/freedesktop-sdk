kind: meson
description: X.org lib pciaccess

build-depends:
- public-stacks/buildsystem-meson.bst
- components/xorg-util-macros.bst

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
  ref: libpciaccess-0.18-0-g04271a93ed65bfde82469509120214424eb918d0
