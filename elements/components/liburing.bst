kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  build-dir: ""

  # Nonstandard configure, override plugin default
  conf-args: >-
    --prefix=%{prefix}
    --includedir=%{includedir}
    --libdir=%{libdir}
    --libdevdir=%{libdir}
    --mandir=%{mandir}
    --datadir=%{datadir}

  make-args: "src"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liburing-ffi.so'
        - '%{libdir}/liburing.so'

sources:
- kind: git_repo
  url: github:axboe/liburing.git
  track: liburing-*
  exclude:
  - '*rc*'
  ref: liburing-2.10-0-ga75ea24754e8cac656c2e0c0f5fda6b2bf5f06bd
