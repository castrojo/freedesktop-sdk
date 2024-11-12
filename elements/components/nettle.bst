kind: autotools

depends:
- public-stacks/runtime-minimal.bst
- filename: components/gmp.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  # Work around race condition in makefiles. The following error
  # message sometimes happen:
  # /bin/sh: line 1: ./desdata: Text file busy
  notparallel: true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnettle.so'
        - '%{libdir}/libhogweed.so'

sources:
- kind: git_repo
  url: nettle:nettle.git
  track: nettle_*
  exclude:
  - nettle_*rc*
  ref: nettle_3.10_release_20240616-0-gb8c841dc3278dec0812365f02370b41ea9d4ddee
