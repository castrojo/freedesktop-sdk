kind: autotools-recc
description: X.org lib SM

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-ice.bst
- components/xorg-lib-xtrans.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSM.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libsm.git
  track: libSM-*
  ref: libSM-1.2.6-0-g5f6da959a34bcefc425b6e37462553acf44369a3
