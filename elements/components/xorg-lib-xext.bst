kind: autotools_recc
description: X.org lib xext

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXext.so'
  cpe:
    product: libxext

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxext.git
  track: libXext-*
  ref: libXext-1.3.7-0-g2a694ba264ccdb205909909abfe8b136f9156ebe
