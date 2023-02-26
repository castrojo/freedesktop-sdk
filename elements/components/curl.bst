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

sources:
- kind: git_repo
  url: github:curl/curl.git
  track: curl-*
  ref: curl-7_87_0-0-gc12fb3ddaf48e709a7a4deaa55ec485e4df163ee
- kind: patch
  path: patches/curl/remove-doc-timestamp.patch
