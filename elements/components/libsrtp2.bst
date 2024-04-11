kind: meson

build-depends:
- components/doxygen.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Dpcap-tests=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsrtp2.so'

sources:
- kind: git_repo
  url: github:cisco/libsrtp.git
  track: v*.*.*
  ref: v2.6.0-0-gfd08747fa6800b321d53e15feb34da12dc697dee
