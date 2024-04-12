kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/git-minimal.bst
- components/gperf.bst
- components/gtk-doc.bst
- components/patch.bst
- components/python3.bst

depends:
- bootstrap-import.bst
- components/libtasn1.bst
- components/libunistring.bst
- components/libidn2.bst
- components/nettle.bst
- components/p11-kit.bst

variables:

  autogen: |
    ./bootstrap --skip-po --no-git --gnulib-srcdir=%{build-root}/gnulib
    rm -rv devel
  conf-local: >-
    --disable-doc
    --with-default-trust-store-pkcs11="pkcs11:"
    --disable-full-test-suite
    --without-nettle-mini
    --without-included-libtasn1

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgnutls.so'
        - '%{libdir}/libgnutlsxx.so'

sources:
- kind: git_repo
  url: gitlab:gnutls/gnutls.git
  track: '*.*.*'
  ref: 3.8.5-0-g49f4ae2109b7cc969539b90be92a5844bbe7b322
- kind: git_module
  url: gitlab:gnutls/cligen.git
  path: cligen
  ref: ed2ed7b19a5bcbc0f39505722058befc923eeeda
- kind: patch
  path: patches/gnutls/cli-codegen-no-passwd.patch
- kind: git_module
  path: gnulib
  url: gitlab:libidn/gnulib-mirror.git
  ref: 41d5dae3b7d239f167f09e4398f3970845a0ddc0
- kind: git_module
  path: devel/libtasn1
  url: gitlab:gnutls/libtasn1.git
  ref: 2b7ee166f031bea63c5e7badcedc69f1cea69c89
- kind: git_module
  path: devel/nettle
  url: gitlab:gnutls/nettle.git
  ref: 236d79b8bc508ae089f63a75c16f87c7076babdf
