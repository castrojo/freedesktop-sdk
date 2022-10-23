kind: make

build-depends:
- components/bison.bst
- components/flex.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
    SBINDIR="%{sbindir}"
    DATADIR="%{datadir}"
    MANDIR="%{mandir}"

  make: make %{make-args}
  make-install: make -j1 install DESTDIR="%{install-root}" %{make-args}

sources:
- kind: git_tag
  url: kernel:network/iproute2/iproute2.git
  track: main
  ref: v6.0.0-0-g86ae36a70d65051e13c1a7dccfa75f9ad642319b
