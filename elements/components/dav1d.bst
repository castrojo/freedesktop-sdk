kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/nasm.bst

depends:
- public-stacks/runtime-minimal.bst

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
  url: videolan:dav1d.git
  track: '*.*.*'
  ref: 1.5.1-0-g42b2b24fb8819f1ed3643aa9cf2a62f03868e3aa
