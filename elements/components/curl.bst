kind: cmake

build-depends:
- components/_private/buildsystem-cmake.bst
- components/_private/git-minimal.bst
- components/sed.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libnghttp2.bst
- components/libnghttp3.bst
- components/libngtcp2.bst
- components/libpsl.bst
- components/openssl.bst
- components/zlib.bst
- components/zstd.bst

runtime-depends:
- components/ca-certificates.bst

variables:
  cmake-local: >-
    -DCURL_CA_BUNDLE=none
    -DCURL_CA_FALLBACK=ON
    -DBUILD_TESTING=OFF
    -DUSE_NGTCP2=ON

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

sources:
- kind: git_repo
  url: github:curl/curl.git
  track: curl-*
  ref: curl-8_21_0-0-g68720b4837284335b2d63cb358f8f6ce65f5bc55
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
