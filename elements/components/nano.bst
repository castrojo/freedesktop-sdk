kind: autotools_recc
description: GNU nano

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/groff.bst
- components/texinfo.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- components/file.bst
- bootstrap/ncurses.bst
- public-stacks/runtime-minimal.bst

config:
  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"

sources:
- kind: git_repo
  url: savannah:nano.git
  track: v*
  ref: v9.0-0-gc7276e58c98bfcc51ae5714e0154bd68bc67c40a
- kind: git_repo
  url: savannah:gnulib.git
  directory: gnulib
  ref: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
