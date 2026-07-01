# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

(@):
- elements/bootstrap/include/common.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/build/gcc-stage2.bst

variables:
  destdir: "%{install-root}/%{sysroot}%{libdir}/"

config:
  commands:
  # zlib may depend on libgcc_s.so.1. This works linking around issues.
  - |
    mkdir -p "%{destdir}"
    if [ -f "%{tools}/%{triplet}/%{lib}/libgcc_s.so.1" ]; then
      cp "%{tools}/%{triplet}/%{lib}/libgcc_s.so.1" "%{destdir}"
    else
      cp "%{tools}/%{lib}/libgcc_s.so.1" "%{destdir}"
    fi
