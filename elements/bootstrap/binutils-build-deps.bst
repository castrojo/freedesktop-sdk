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
- bootstrap/gnu-config.bst
- filename:
  - bootstrap/glibc.bst
  - bootstrap/zlib.bst
  - bootstrap/elfutils.bst
  config:
    location: "%{sysroot}"


variables:
  install-root: "/"

config:
  commands:
  # zlib may depend on libgcc_s.so.1. This works linking around issues.
  - |
    if [ -f "%{tools}/%{triplet}/%{lib}/libgcc_s.so.1" ]; then
      cp "%{tools}/%{triplet}/%{lib}/libgcc_s.so.1" "%{sysroot}%{libdir}/"
    else
      cp "%{tools}/%{lib}/libgcc_s.so.1" "%{sysroot}%{libdir}/"
    fi
