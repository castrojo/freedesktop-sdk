kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/_private/systemd-stage1.bst # Depends on udev

depends:
- components/libcbor.bst

variables:
  cmake-local: >-
    -DBUILD_STATIC_LIBS:BOOL=FALSE

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfido2.so'

sources:
- kind: git_repo
  url: github:Yubico/libfido2.git
  track: '*.*.*'
  ref: 1.16.0-0-g7dc6b3c52d441c64a4235ae276a23865243395a1
