kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/bison.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libxml2.bst
- components/xorg-data-xkeyboard-config.bst

variables:
  meson-local: >-
    -Denable-docs=false
    -Denable-x11=true
    -Denable-tools=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxkbcommon.so'
        - '%{libdir}/libxkbcommon-x11.so'
        - '%{libdir}/libxkbregistry.so'

sources:
- kind: git_repo
  url: github:xkbcommon/libxkbcommon.git
  track: xkbcommon-*
  ref: xkbcommon-1.8.0-0-g76740e0c4583ae49675e7ba8213d31ee09aa00d2
