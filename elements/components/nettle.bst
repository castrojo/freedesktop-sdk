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
- kind: git_tag
  url: nettle:nettle.git
  track: release-3.7-fixes
  exclude:
  - nettle_*rc*
  ref: nettle_3.7.3_release_20210606-0-g52bacacaf4339fd78289f58919732f1f35bea1c1
