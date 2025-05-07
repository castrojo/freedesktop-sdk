kind: autotools

depends:
- public-stacks/runtime-minimal.bst
- filename: components/xorg-util-macros.bst
  type: build
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xrender.bst
- filename: components/freetype.bst
- filename: components/fontconfig.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXft.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxft.git
  track: libXft-*
  ref: libXft-2.3.9-0-gf4805c8645914cbdcfd42e71051ba3f8fc664ef5
