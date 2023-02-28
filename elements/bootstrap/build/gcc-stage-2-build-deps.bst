kind: script

(@):
- elements/bootstrap/include/common.yml

build-depends:
- bootstrap/base-sdk/autoconf2.69.bst
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/tar.bst
- bootstrap/build/binutils-stage1.bst
- bootstrap/build/python3.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/glibc.bst

- bootstrap/glibc.bst

variables:
  install-root: "/"

config:
  layout:
  - element: bootstrap/base-sdk/autoconf2.69.bst
    destination: "/"
  - element: bootstrap/base-sdk/automake.bst
    destination: "/"
  - element: bootstrap/base-sdk/gettext.bst
    destination: "/"
  - element: bootstrap/base-sdk/libtool.bst
    destination: "/"
  - element: bootstrap/build/binutils-stage1.bst
    destination: "/"
  - element: bootstrap/build/python3.bst
    destination: "/"
  - element: bootstrap/gnu-config.bst
    destination: "/"
  - element: bootstrap/glibc.bst
    destination: "%{sysroot}"
