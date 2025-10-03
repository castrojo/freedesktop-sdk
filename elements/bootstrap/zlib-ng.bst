kind: autotools
description: zlib

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

variables:
  conf-args: >-
    --prefix=%{prefix}
    --sharedlibdir=%{libdir}
    --libdir=%{libdir}
    --zlib-compat
    --without-new-strategies

environment:
  CHOST: '%{triplet}'

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libz.so'

  cpe:
    vendor: zlib-ng

sources:
- kind: git_repo
  url: github:zlib-ng/zlib-ng.git
  track: "*.*.*"
  ref: 2.2.5-0-g425439062b114a0f6cf625022c41d929c7e879f9
