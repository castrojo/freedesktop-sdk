kind: script

(@):
- elements/bootstrap/include/common.yml

build-depends:
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- bootstrap/libsepol.bst
- bootstrap/pcre2.bst

variables:
  install-root: "/"

config:
  layout:
  - element: bootstrap/gnu-config.bst
    destination: "/"
  - element: bootstrap/base-sdk/pkg-config.bst
    destination: "/"
  - element: bootstrap/build/gcc-stage2.bst
    destination: "/"
  - element: bootstrap/build/debug-utils.bst
    destination: "/"

  - element: bootstrap/libsepol.bst
    destination: "%{sysroot}"
  - element: bootstrap/pcre2.bst
    destination: "%{sysroot}"
