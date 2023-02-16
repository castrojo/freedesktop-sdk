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
  track: master
  ref: 1.1.0-0-g9593e625b75d498d1edea544da21ea764b98d507
