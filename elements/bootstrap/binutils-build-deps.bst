kind: script

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"
- filename: bootstrap/zlib.bst
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
