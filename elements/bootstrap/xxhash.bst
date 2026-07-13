# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/xxhash-source.yml

build-depends:
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

variables:
  arch-flags: ''
  make-args: >-
    CC="%{triplet}-gcc"
    AR="%{triplet}-ar"
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
    MOREFLAGS="%{arch-flags} ${CFLAGS} ${LDFLAGS}"
    DISPATCH=%{dispatch}
  (?):
  - target_arch in ("i686", "x86_64"):
      dispatch: 1
  - target_arch not in ("i686", "x86_64"):
      dispatch: 0
  - x86_64_v3:
      arch-flags: >-
        -DXXH_X86DISPATCH_ALLOW_AVX

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxxhash.so'

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete
