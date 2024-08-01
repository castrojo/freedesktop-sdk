kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
- extensions/gplatform-oneapi/intel-graphics-compiler.bst
- extensions/platform-vaapi-intel/gmmlib.bst

sources:
- kind: git_repo
  url: github:intel/compute-runtime.git
  track: '*.*'
  ref: 24.26.30049.6-0-ge16f47e375e4324dae07aadbfe953002a1c45195
  