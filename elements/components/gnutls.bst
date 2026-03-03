kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/_private/git-minimal.bst
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
  ref: 3.8.12-0-g34fb40faadf16e641c34458f12a848bbf5bfaab5
- kind: git_module
  url: gitlab:gnutls/cligen.git
  path: cligen
  ref: f6ff7a8611d67a4ffa8ad17d40bbc6cef348cddb
- kind: git_module
  path: gnulib
  url: gitlab:libidn/gnulib-mirror.git
  ref: 05c63bc908a67a316fea29ddf4c702d89cf5bdec
- kind: git_module
  path: devel/libtasn1
  url: gitlab:gnutls/libtasn1.git
  ref: 6b45b25e94ea538192cc0f97e9ad57171d1c6374
- kind: git_module
  path: devel/nettle
  url: gitlab:gnutls/nettle.git
  ref: 40178e78ae73ec2a8cda8cd53664df9c73ac1961
- kind: patch
  path: patches/gnutls/cli-codegen-no-passwd.patch
- kind: patch
  path: patches/gnutls/drop-submodule.patch
- kind: patch
  path: patches/gnutls/nettle_v4.patch
