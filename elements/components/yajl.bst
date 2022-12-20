kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DLIB_SUFFIX="/%{gcc_triplet}"

sources:
- kind: git_repo
  url: github:lloyd/yajl.git
  track: '*.*.*'
  ref: 2.1.0-0-ga0ecdde0c042b9256170f2f8890dd9451a4240aa
