kind: cmake

build-depends:
- components/gcc.bst
- components/stripper.bst
- components/cmake-stage1.bst
- components/gettext.bst
- components/ninja.bst
- components/pkg-config.bst
- components/git-minimal.bst
- components/sed.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libnghttp2.bst
- components/libpsl.bst
- components/openssl.bst

runtime-depends:
- components/ca-certificates.bst

variables:
  cmake-local: >-
    -DCURL_CA_BUNDLE=none
    -DCURL_CA_FALLBACK=ON
    -DBUILD_TESTING=OFF

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
  ref: curl-8_12_1-0-g57495c64871d18905a0941db9196ef90bafe9a29
