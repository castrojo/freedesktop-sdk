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
  track: nettle_*
  exclude:
  - nettle_*rc*
  ref: nettle_3.8_release_20220602-0-gea4ea5e6904124b297ade0d1b182c5e530909765
