kind: autotools
description: X.org lib x11

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xtrans.bst
- filename: components/xorg-lib-xcb.bst
- filename: components/perl.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libX11.so'
        - '%{libdir}/libX11-xcb.so'
  cpe:
    product: libx11
    patches:
    - CVE-2023-43787
    - CVE-2023-43785
    - CVE-2023-43786

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libx11.git
  # Frozen due to ABI break
  ref: libX11-1.8.1-0-g3a30ada60c5217ada37b143b541c8e6f6284c7fa
- kind: patch_queue
  path: patches/xorg-lib-x11
