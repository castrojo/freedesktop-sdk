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
  ref: v7.2.0-0-g880505966c17d90243c39e446d79da6236fb06ba
