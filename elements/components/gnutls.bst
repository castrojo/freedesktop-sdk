kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3.bst

depends:
- bootstrap-import.bst
- components/libtasn1.bst
- components/libunistring.bst
- components/libidn2.bst
- components/nettle.bst
- components/p11-kit.bst

variables:

  conf-local: >-
    --disable-doc
    --with-default-trust-store-pkcs11="pkcs11:"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgnutls.so'
        - '%{libdir}/libgnutlsxx.so'
  cpe:
    patches:
    - CVE-2024-0553

sources:
- kind: tar
  url: tar_https:www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.0.tar.xz
  ref: 0ea0d11a1660a1e63f960f157b197abe6d0c8cb3255be24e1fb3815930b9bdc5
- kind: patch_queue
  path: patches/gnutls
