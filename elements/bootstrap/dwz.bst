kind: manual

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/dwz-source.yml

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"
- filename: bootstrap/elfutils.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst
- bootstrap/elfutils.bst

variables:
  make-args: >-
    CC='%{triplet}-gcc'
    CFLAGS="${CFLAGS}"
    CXXFLAGS="${CXXFLAGS}"
    LDFLAGS="${LDFLAGS}"

config:
  build-commands:
  - |
    make %{make-args}

  install-commands:
  - |
    make %{make-args} -j1 install DESTDIR="%{install-root}"


public:
  bst:
    split-rules:
      devel:
        (>):
        - "/**"
