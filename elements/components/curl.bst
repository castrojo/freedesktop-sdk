kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libnghttp2.bst
- components/openssl.bst

runtime-depends:
- components/ca-certificates.bst

# --with-ca-fallback only works with OpenSSL and GnuTLS backends
# so only those can be selected. We pick GnuTLS due to licensing
# reasons

variables:
  conf-local: >-
    --without-ca-bundle
    --with-ca-fallback
    --with-ssl
    --with-nghttp2
    --enable-debug
    --enable-optimize
    --disable-warnings
    --disable-curldebug

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/curl-config'
        - '%{libdir}/libcurl.so'

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'
    patches:
    - CVE-2023-38545
    - CVE-2023-38546
    - CVE-2023-27534
    - CVE-2023-27533

sources:
- kind: git_tag
  url: github:curl/curl.git
  track: master
  ref: curl-7_88_1-0-g046209e561b7e9b5aab1aef7daebf29ee6e6e8c7
- kind: patch_queue
  path: patches/curl
