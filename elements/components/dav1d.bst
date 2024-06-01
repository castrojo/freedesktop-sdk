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
- kind: git_repo
  url: git_https:code.videolan.org/videolan/dav1d.git
  track: '*.*.*'
  ref: 1.4.2-0-g805d9e5a8ffce3ef78cebde4bfedf3642907b2d3
