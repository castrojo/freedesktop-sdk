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
  ref: 1.3.0-0-g48035599cdd4e4415732e408c407e0c1cd1c7444
