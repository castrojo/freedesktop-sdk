kind: autotools
description: X.org util macros

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
      - /**

sources:
- kind: git_tag
  url: freedesktop:xorg/util/macros.git
  track: master
  ref: util-macros-1.20.0-0-gcb147377e9341af05232f95814022abdecf14024
