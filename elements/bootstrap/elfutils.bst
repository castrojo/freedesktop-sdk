kind: autotools

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/elfutils-source.yml

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename:
  - bootstrap/bzip2.bst
  - bootstrap/zlib.bst
  - bootstrap/zstd.bst
  - bootstrap/xz.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/bzip2.bst
- bootstrap/zlib.bst
- bootstrap/zstd.bst
- bootstrap/xz.bst

variables:
  autogen: autoreconf -fvi
  conf-local: >-
    utrace_cv_CC_m32=none
    --disable-debuginfod
    --enable-libdebuginfod=dummy

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

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
