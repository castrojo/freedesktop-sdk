kind: meson_recc

build-depends:
- public-stacks/buildsystem-meson.bst
- components/libxslt.bst
- components/perl.bst
- components/python3.bst
- components/xorg-util-macros.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-app-xkbcomp.bst

variables:
  license-element-name: xorg-data-xkeyboard-config
  meson-local: >-
    -Dcompat-rules=true
    -Dxorg-rules-symlinks=true

sources:
- kind: git_repo
  url: freedesktop:xkeyboard-config/xkeyboard-config.git
  track: xkeyboard-config-*
  ref: xkeyboard-config-2.47-0-ga79055334104d382bd511760b67acf9a5a161361
