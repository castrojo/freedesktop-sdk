kind: autotools

(@):
- include/_private/autotools-recc.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- (@): include/_private/gcc-for-recc.yml

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
  ref: liburing-2.14-0-ge3d35ea59d3ba09075ed4d7751e4bb9049cce64a
