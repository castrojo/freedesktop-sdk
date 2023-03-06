kind: script

(@):
- elements/bootstrap/include/common.yml

build-depends:
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/coreutils-manpages.bst
- bootstrap/gnu-config.bst
- bootstrap/acl.bst
- bootstrap/libselinux.bst

variables:
  install-root: "/"

config:
  layout:
  - element: bootstrap/gnu-config.bst
    destination: "/"
  - element: bootstrap/base-sdk/texinfo.bst
    destination: "/"
  - element: bootstrap/build/gcc-stage2.bst
    destination: "/"
  - element: bootstrap/build/debug-utils.bst
    destination: "/"
  - element: bootstrap/build/coreutils-manpages.bst
    destination: "/"

  - element: bootstrap/acl.bst
    destination: "%{sysroot}"
  - element: bootstrap/libselinux.bst
    destination: "%{sysroot}"
