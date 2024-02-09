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
  ref: libxkbfile-1.1.3-0-g39a5f8e67615f443e76146769d5f5f9abc5ebd2f
