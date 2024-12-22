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
- kind: git_repo
  url: savannah:nano.git
  track: v*
  ref: v8.3-0-ga9cf841042f317e20a7abfc14f7f56ab123c7d0b
- kind: git_repo
  url: savannah:gnulib.git
  directory: gnulib
  ref: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
