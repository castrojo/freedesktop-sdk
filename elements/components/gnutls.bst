# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/bison.bst
- components/gperf.bst
- components/gtk-doc.bst
- components/patch.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libidn2.bst
- components/libtasn1.bst
- components/libunistring.bst
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
  ref: 3.8.13-0-gb390d80208ed60f1b33ad899475951a8efb40ccd
- kind: git_module
  url: gitlab:gnutls/cligen.git
  path: cligen
  ref: 67883b2490664e3ae0c9b21b919c38ac6ece6705
- kind: git_module
  path: gnulib
  url: gitlab:libidn/gnulib-mirror.git
  ref: 1cc0125a28cba4e8503d853bf99b854fe4dd454c
- kind: git_module
  path: devel/libtasn1
  url: gitlab:gnutls/libtasn1.git
  ref: 6b45b25e94ea538192cc0f97e9ad57171d1c6374
- kind: patch
  path: patches/gnutls/cli-codegen-no-passwd.patch
- kind: patch
  path: patches/gnutls/drop-submodule.patch
