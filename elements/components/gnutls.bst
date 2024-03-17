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
    - CVE-2024-0567

sources:
- kind: tar
  url: tar_https:www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.10.tar.xz
  ref: b6e4e8bac3a950a3a1b7bdb0904979d4ab420a81e74de8636dd50b467d36f5a9
- kind: patch_queue
  path: patches/gnutls
