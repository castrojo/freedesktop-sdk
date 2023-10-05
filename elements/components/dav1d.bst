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
  track: '1.2.*'
  ref: 1.2.1-0-g8a6f054ef1e0f7886bc6e53e6be97c427154fe85
