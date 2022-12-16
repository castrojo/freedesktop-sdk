kind: autotools
description: GNU nano

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/texinfo.bst
  type: build

config:
  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"

sources:
- kind: git_tag
  url: savannah:nano.git
  track: master
  ref: v7.1-0-gf09e6c183eec6642d4b3a7545758553c0811d85c
- kind: git_tag
  url: savannah:gnulib.git
  track: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
  track-tags: false
  directory: gnulib
  ref: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
