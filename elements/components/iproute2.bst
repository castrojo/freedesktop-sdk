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
  ref: v6.17.0-0-gd2a8ffe85ac64f91ee2aa7679a5046f321b54127
