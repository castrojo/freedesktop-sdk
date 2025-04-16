kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DBUILD_STATIC_LIBS=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libjson-c.so'

sources:
- kind: git_repo
  url: github:json-c/json-c.git
  track: json-c-*
  ref: json-c-0.18-20240915-0-g41a55cfcedb54d9c1874f2f0eb07b504091d7e37
