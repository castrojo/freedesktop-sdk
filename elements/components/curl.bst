kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libnghttp2.bst
- components/openssl.bst
- components/libpsl.bst

runtime-depends:
- components/ca-certificates.bst

variables:
  conf-local: >-
    --without-ca-bundle
    --with-ca-fallback
    --with-ssl
    --with-nghttp2
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
  ref: curl-8_15_0-0-gcfbfb65047e85e6b08af65fe9cdbcf68e9ad496a
