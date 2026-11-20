# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/bison.bst
- components/gperf.bst
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
  ref: 3.8.14-0-g6542d6fc9e05a7fd5370da0832dbbc6bbd7a54db
- kind: git_module
  url: gitlab:gnutls/cligen.git
  path: cligen
  ref: 67883b2490664e3ae0c9b21b919c38ac6ece6705
- kind: git_module
  path: gnulib
  url: gitlab:libidn/gnulib-mirror.git
  ref: 41bae5c2f367ca71652f3b1f98f1257035994acd
- kind: patch
  path: patches/gnutls/cli-codegen-no-passwd.patch
- kind: patch
  path: patches/gnutls/drop-submodule.patch
- kind: patch
  path: patches/gnutls/bootstrap-without-gtk-doc.patch
