kind: autotools_recc
description: X.org util macros

build-depends:
- public-stacks/buildsystem-autotools.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
      - /**

sources:
- kind: git_repo
  url: freedesktop:xorg/util/macros.git
  track: util-macros-*
  ref: util-macros-1.20.2-0-ga9d71e3fd8e6758b70be31c586921bbbcd2a8449
