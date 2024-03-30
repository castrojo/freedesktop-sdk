kind: autotools

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

variables:
  autogen: ./autogen.sh --no-po4a --no-doxygen

config:
  configure-commands:
    (<):
    - |
      rm -rv tests

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblzma.so'

(@):
- elements/include/xz-source.yml
- elements/bootstrap/include/target.yml
