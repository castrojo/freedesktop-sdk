kind: autotools

depends:
- filename: bootstrap-import.bst
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
  track: nettle_3.9.*
  exclude:
  - nettle_*rc*
  ref: nettle_3.9.1_release_20230601-0-gd2cc9b95b50440c331ee143312309951a7e8d7ca
