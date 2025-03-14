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
  ref: xkbcommon-1.8.1-0-gb3465081878e80ca6c11fe35c81787ec374ec15a
