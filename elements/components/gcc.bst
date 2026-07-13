# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/gcc-base.bst

runtime-depends:
- bootstrap/binutils.bst
- bootstrap/libxcrypt.bst
- bootstrap/zstd.bst
- components/gcc-libs.bst
- components/gcc-manifest.bst
- public-stacks/runtime-minimal.bst

config:
  exclude:
  - gcc-libs
  include-orphans: true

public:
  bst:
    split-rules:
      runtime:
        - '%{libdir}/lib*.so.*'

      devel:
        (>):
        - '%{bindir}/*'
        - '%{libexecdir}'
        - '%{libexecdir}/**'
        - '%{datadir}/man'
        - '%{datadir}/man/**'
        - '%{datadir}/info'
        - '%{datadir}/info/**'
        - '%{datadir}/locale'
        - '%{datadir}/locale/**'
        - '%{indep-libdir}/gcc'
        - '%{indep-libdir}/gcc/**'
        - '%{libdir}/gcc'
        - '%{libdir}/gcc/**'
        - '%{libdir}/lib*.a'
        - '%{libdir}/lib*_preinit.o'
        - '%{libdir}/lib*.spec'
        - '%{libdir}/libcc1.so'

      static-blocklist:
        (=):
        - '%{libdir}/libasan.a'
        - '%{libdir}/libatomic.a'
        - '%{libdir}/libatomic_asneeded.a'
        - '%{libdir}/libgfortran.a'
        - '%{libdir}/libgomp.a'
        - '%{libdir}/libitm.a'
        - '%{libdir}/liblsan.a'
        - '%{libdir}/libquadmath.a'
        - '%{libdir}/libsupc++.a'
        - '%{libdir}/libstdc++exp.a'
        - '%{libdir}/libtsan.a'
        - '%{libdir}/libubsan.a'
        - '%{libdir}/libobjc.a'
        - '%{libdir}/libhwasan.a'

      # Not actually used, included for completeness
      static-allowlist:
        - '%{indep-libdir}/gcc/**/*.a'
        - '%{indep-libdir}/gcc/%{triplet}/**/*.a'
