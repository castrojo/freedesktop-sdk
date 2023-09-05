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
- public-stacks/runtime-minimal.bst
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
  ref: 3.8.7-0-g994d9392a607308e452ecae87caafd6ea81288f3
- kind: git_module
  url: gitlab:gnutls/cligen.git
  path: cligen
  ref: 59911854af60377b045ec8db88ae969b5bad1f66
- kind: patch
  path: patches/gnutls/cli-codegen-no-passwd.patch
- kind: git_module
  path: gnulib
  url: gitlab:libidn/gnulib-mirror.git
  ref: bd1e981434c98751b1106a1744e77a27317b52b3
- kind: git_module
  path: devel/libtasn1
  url: gitlab:gnutls/libtasn1.git
  ref: 2b7ee166f031bea63c5e7badcedc69f1cea69c89
- kind: git_module
  path: devel/nettle
  url: gitlab:gnutls/nettle.git
  ref: 40178e78ae73ec2a8cda8cd53664df9c73ac1961
