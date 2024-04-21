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
- kind: git_repo
  url: freedesktop:xorg/util/macros.git
  track: util-macros-*
  ref: util-macros-1.20.1-0-g7ed2b3798c030bd1729b699b446b43aba2ec606e
