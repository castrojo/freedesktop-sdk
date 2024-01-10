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
- kind: git_repo
  url: kernel:network/iproute2/iproute2.git
  track: v*
  ref: v6.7.0-0-g3dc3445bbfa9b84d4166e5837f8d5a4994faf2e7
