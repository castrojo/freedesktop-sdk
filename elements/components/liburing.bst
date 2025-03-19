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
  ref: liburing-2.9-0-g08468cc3830185c75f9e7edefd88aa01e5c2f8ab
