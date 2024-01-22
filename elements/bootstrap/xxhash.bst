kind: make

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/xxhash-source.yml

build-depends:
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

variables:
  make-args: >-
    CC="%{triplet}-gcc"
    AR="%{triplet}-ar"
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
    MOREFLAGS="${CFLAGS} ${LDFLAGS}"
    DISPATCH=%{dispatch}
  (?):
  - target_arch in ("i686", "x86_64"):
      dispatch: 1
  - target_arch not in ("i686", "x86_64"):
      dispatch: 0

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxxhash.so'

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete
