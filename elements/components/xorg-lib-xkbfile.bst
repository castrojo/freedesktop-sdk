kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-util-macros.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxkbfile.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxkbfile.git
  track: libxkbfile-*
  ref: libxkbfile-1.1.2-0-g3c0bca45d61982295ae0051fb874d57dc3d6f327
