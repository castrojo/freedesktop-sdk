kind: make

(@):
- elements/bootstrap/include/base-sdk.yml
- elements/bootstrap/include/xxhash-source.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/gnu-config.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
    MOREFLAGS="${CFLAGS} ${LDFLAGS}"

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete
