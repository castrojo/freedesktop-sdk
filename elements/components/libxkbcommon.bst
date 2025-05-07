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
  ref: xkbcommon-1.9.2-0-gdd642359f8d43c09968e34ca7f1eb1121b2dfd70
