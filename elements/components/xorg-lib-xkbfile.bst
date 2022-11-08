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
- kind: git_tag
  url: freedesktop:xorg/lib/libxkbfile.git
  track: master
  ref: libxkbfile-1.1.1-0-gf855ea9cf3aecc74c3b07da924ff2e36944e4be1

