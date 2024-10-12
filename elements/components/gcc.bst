kind: filter

build-depends:
- components/gcc-base.bst

runtime-depends:
- bootstrap/binutils.bst
- bootstrap/libxcrypt.bst
- components/gcc-manifest.bst
- components/libstdc++.bst
- public-stacks/runtime-minimal.bst

config:
  exclude:
  - libgcc-s
  - libstdc++
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
        - '%{libdir}/liblsan.so'
        - '%{libdir}/libstdc++.so'
        - '%{libdir}/libgomp.so'
        - '%{libdir}/libatomic.so'
        - '%{libdir}/libubsan.so'
        - '%{libdir}/libquadmath.so'
        - '%{libdir}/libitm.so'
        - '%{libdir}/libtsan.so'
        - '%{libdir}/libmpxwrappers.so'
        - '%{libdir}/libmpx.so'
        - '%{libdir}/libcilkrts.so'
        - '%{libdir}/libasan.so'
        - '%{libdir}/libgfortran.so'
        - '%{libdir}/libcc1.so'
        - '%{libdir}/lib*.spec'
        - '%{libdir}/libobjc.so'
        - '%{libdir}/libhwasan.so'

      static-blocklist:
        (=):
        - '%{libdir}/libasan.a'
        - '%{libdir}/libatomic.a'
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
