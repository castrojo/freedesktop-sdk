kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xrender.bst
- components/freetype.bst
- components/fontconfig.bst

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
