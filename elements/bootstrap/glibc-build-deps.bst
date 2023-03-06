kind: script

(@):
- elements/bootstrap/include/common.yml

build-depends:
- bootstrap/base-sdk/bison.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage1.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/python3.bst
- bootstrap/gnu-config.bst
- bootstrap/linux-headers.bst

variables:
  install-root: "/"

config:
  layout:
  - element: bootstrap/gnu-config.bst
    destination: "/"
  - element: bootstrap/base-sdk/bison.bst
    destination: "/"
  - element: bootstrap/base-sdk/gettext.bst
    destination: "/"
  - element: bootstrap/base-sdk/texinfo.bst
    destination: "/"
  - element: bootstrap/build/gcc-stage1.bst
    destination: "/"
  - element: bootstrap/build/debug-utils.bst
    destination: "/"
  - element: bootstrap/build/python3.bst
    destination: "/"

  - element: bootstrap/linux-headers.bst
    destination: "%{sysroot}"
