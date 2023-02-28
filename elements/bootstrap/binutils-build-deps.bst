kind: script

(@):
- elements/bootstrap/include/common.yml

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/bison.bst
- bootstrap/base-sdk/flex.bst
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/glibc.bst
- bootstrap/gnu-config.bst
- bootstrap/zlib.bst
- bootstrap/elfutils.bst


variables:
  install-root: "/"

config:
  layout:
  - element: bootstrap/gnu-config.bst
    destination: "/"
  - element: bootstrap/base-sdk/automake.bst
    destination: "/"
  - element: bootstrap/base-sdk/bison.bst
    destination: "/"
  - element: bootstrap/base-sdk/flex.bst
    destination: "/"
  - element: bootstrap/base-sdk/pkg-config.bst
    destination: "/"
  - element: bootstrap/base-sdk/gettext.bst
    destination: "/"
  - element: bootstrap/base-sdk/texinfo.bst
    destination: "/"
  - element: bootstrap/build/gcc-stage2.bst
    destination: "/"
  - element: bootstrap/build/debug-utils.bst
    destination: "/"

  - element: bootstrap/glibc.bst
    destination: "%{sysroot}"
  - element: bootstrap/zlib.bst
    destination: "%{sysroot}"
  - element: bootstrap/elfutils.bst
    destination: "%{sysroot}"

  commands:
  # zlib may depend on libgcc_s.so.1. This works linking around issues.
  - |
    if [ -f "%{tools}/%{triplet}/%{lib}/libgcc_s.so.1" ]; then
      cp "%{tools}/%{triplet}/%{lib}/libgcc_s.so.1" "%{sysroot}%{libdir}/"
    else
      cp "%{tools}/%{lib}/libgcc_s.so.1" "%{sysroot}%{libdir}/"
    fi
