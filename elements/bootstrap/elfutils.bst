kind: autotools

build-depends:
- bootstrap/elfutils-build-deps.bst

runtime-depends:
- bootstrap/bzip2.bst
- bootstrap/zlib.bst

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/elfutils-source.yml

variables:
  autogen: autoreconf -fvi
  conf-local: >-
    utrace_cv_CC_m32=none
    --without-lzma
    --disable-debuginfod
    --enable-libdebuginfod=dummy

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

public:
  bst:
    split-rules:
      runtime:
      - '%{libdir}/lib*.so.*'

      devel:
        (>):
        - '%{bindir}/**'
        - '%{libdir}/libasm.so'
        - '%{libdir}/libdw.so'
        - '%{libdir}/libelf.so'
        - "%{libdir}/libdebuginfod.so"
