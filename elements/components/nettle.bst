kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gmp.bst

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
  ref: nettle_3.10.1_release_20241230-0-gef717fe1c6dba4e964474aca92ea8e3e94b524c6
