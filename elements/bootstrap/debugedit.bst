kind: autotools

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/openssl.bst
  config:
    location: "%{sysroot}"
- filename: bootstrap/popt.bst
  config:
    location: "%{sysroot}"
- filename: bootstrap/bzip2.bst
  config:
    location: "%{sysroot}"
- filename: bootstrap/elfutils.bst
  config:
    location: "%{sysroot}"
- filename: bootstrap/file.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/popt.bst
- bootstrap/bzip2.bst
- bootstrap/elfutils.bst
- bootstrap/file.bst
- bootstrap/openssl.bst

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/debugedit-source.yml

variables:
  builddir: ''
  conf-link-args: >-
    --disable-shared
    --disable-static
  conf-local: >-
    --disable-bdb
    --without-lua
    --with-crypto=openssl
    --without-archive

  make-install: make -j1 install-rpmlibexecPROGRAMS DESTDIR="%{install-root}" rpmlibexec_PROGRAMS="debugedit" rpmlibexecdir="%{bindir}"

config:
  configure-commands:
    (<):
    - |
      autoreconf -f -v -i

  build-commands:
  - |
    make include/rpm/argv.h
    make include/rpm/rpmbase64.h
    make include/rpm/rpmfileutil.h
    make include/rpm/rpmio.h
    make include/rpm/rpmkeyring.h
    make include/rpm/rpmlog.h
    make include/rpm/rpmmacro.h
    make include/rpm/rpmpgp.h
    make include/rpm/rpmsq.h
    make include/rpm/rpmstring.h
    make include/rpm/rpmstrpool.h
    make include/rpm/rpmsw.h
    make include/rpm/rpmurl.h
    make include/rpm/rpmutil.h
    make include/rpm/rpmtypes.h
    make include/rpm/rpmtag.h
    make -C misc libmisc.la
    make -C rpmio librpmio.la
    make debugedit

public:
  bst:
    split-rules:
      runtime: []
      devel:
      - /**
