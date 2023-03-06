kind: script

(@):
- elements/bootstrap/include/common.yml

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- bootstrap/glibc.bst

variables:
  install-root: "/"

config:
  layout:
  - element: bootstrap/gnu-config.bst
    destination: "/"
  - element: bootstrap/base-sdk/automake.bst
    destination: "/"
  - element: bootstrap/base-sdk/gettext.bst
    destination: "/"
  - element: bootstrap/base-sdk/pkg-config.bst
    destination: "/"
  - element: bootstrap/base-sdk/texinfo.bst
    destination: "/"
  - element: bootstrap/build/gcc-stage2.bst
    destination: "/"
  - element: bootstrap/build/debug-utils.bst
    destination: "/"

  - element: bootstrap/glibc.bst
    destination: "%{sysroot}"
