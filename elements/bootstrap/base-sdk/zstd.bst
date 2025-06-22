kind: make

(@):
- elements/bootstrap/include/base-sdk.yml
- elements/bootstrap/include/zstd-source.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"

config:
  install-commands:
    (>):
    - |
      rm -f '%{install-root}%{libdir}'/*.a

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libzstd.so'
