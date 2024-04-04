kind: autotools

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/zlib.bst
  config:
    location: "%{sysroot}"
- filename: bootstrap/bzip2.bst
  config:
    location: "%{sysroot}"
- filename: bootstrap/xz.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/zlib.bst
- bootstrap/bzip2.bst
- bootstrap/xz.bst


(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/elfutils-source.yml

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
