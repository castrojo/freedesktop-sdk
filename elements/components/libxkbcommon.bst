kind: meson-recc

build-depends:
- public-stacks/buildsystem-meson.bst
- components/bison.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
  ref: xkbcommon-1.13.1-0-g6f76d19db72b5d450e927b41e1e96cbe3252aba8
