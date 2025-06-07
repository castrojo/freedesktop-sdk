kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

depends:
- bootstrap-import.bst
- components/libnghttp2.bst
- components/libpsl.bst
- components/openssl.bst

runtime-depends:
- components/ca-certificates.bst

variables:
  conf-local: >-
    --without-ca-bundle
    --with-ca-fallback
    --with-libpsl
    --with-ssl
    --with-nghttp2
    --enable-optimize
    --disable-warnings
    --disable-curldebug
    --disable-ssls-export

config:
  configure-commands:
    (<):
    - |
      set -u
      TAG=$(git describe | cut -d- -f2)
      REF=$(git rev-parse curl-${TAG})
      PKGVER="${TAG//_/.}"
      TIMESTAMP=$(git log -1 --format=%cs "${REF}")
      sed -i \
      -e "/\WLIBCURL_VERSION\W/c #define LIBCURL_VERSION \"${PKGVER}\"" \
      -e "/\WLIBCURL_TIMESTAMP\W/c #define LIBCURL_TIMESTAMP \"${TIMESTAMP}\"" \
      include/curl/curlver.h

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
  ref: curl-8_14_1-0-gfdb8a789d2b446b77bd7cdd2eff95f6cbc814cf4
