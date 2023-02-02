kind: manual

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/dwz-source.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/gnu-config.bst

variables:
  make-args: >-
    CFLAGS="${CFLAGS}"
    CXXFLAGS="${CXXFLAGS}"
    LDFLAGS="${LDFLAGS}"

config:
  build-commands:
  - |
    make %{make-args}

  install-commands:
  - |
    make %{make-args} -j1 install DESTDIR="%{install-root}" prefix=%{prefix}
