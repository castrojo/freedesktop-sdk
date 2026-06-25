kind: make

build-depends:
- components/gyp.bst
- components/python3.bst
- components/pkg-config.bst
- public-stacks/buildsystem-make.bst

depends:
- components/icu.bst
- components/openssl.bst
- components/libnghttp2.bst
- components/brotli.bst

variables:
  optimize-debug: "false"
  debug_flags: "-g1"

config:
  configure-commands:
  - >-
    ./configure
    --openssl-use-def-ca-store
    --shared-nghttp2
    --shared-openssl
    --shared-zlib
    --with-intl=system-icu
    --shared

sources:
- kind: git_repo
  url: github:nodejs/node.git
  track: 'v*'
  ref: v26.4.0-0-g2022edf3e32ce28ee08b17f8566243a090dacd95
- kind: patch
  path: patches/nodejs/0001-deps-fix-V8-build-failures-by-adding-climits-include.patch
