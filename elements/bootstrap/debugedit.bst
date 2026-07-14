# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/debugedit-source.yml

build-depends:
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/gcc-stage2.bst
- filename: bootstrap/elfutils.bst
  config:
    location: "%{sysroot}"
- bootstrap/gnu-config.bst
- filename: bootstrap/xxhash.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/elfutils.bst
- bootstrap/xxhash.bst

variables:
  conf-local: >-
    ac_cv_func_malloc_0_nonnull=yes
    ac_cv_func_realloc_0_nonnull=yes

public:
  bst:
    split-rules:
      devel:
      - '%{bindir}/find-debuginfo'
      - '%{bindir}/sepdebugcrcfix'
