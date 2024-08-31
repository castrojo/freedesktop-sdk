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

sources:
- kind: tar
  url: tar_https:www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.7.tar.xz
  ref: fe302f2b6ad5a564bcb3678eb61616413ed5277aaf8e7bf7cdb9a95a18d9f477
