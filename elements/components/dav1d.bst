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
  ref: 1.4.0-0-gbb645893f374ab694b10a79f1205a728e010f2c9
