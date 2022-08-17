kind: autotools

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

variables:
  autogen: cd %{conf-root} && ./autogen.sh --no-po4a

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblzma.so'

(@):
- elements/include/xz-source.yml
- elements/bootstrap/include/target.yml
