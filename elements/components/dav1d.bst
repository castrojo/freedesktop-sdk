kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/nasm.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Denable_tests=false
    -Dxxhash_muxer=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdav1d.so'

sources:
- kind: git_tag
  url: git_https:code.videolan.org/videolan/dav1d.git
  ref: 0.9.2-0-g7b433e077298d0f4faf8da6d6eb5774e29bffa54
