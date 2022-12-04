kind: cmake

build-depends:
- components/cmake.bst

depends:
- bootstrap-import.bst

variables:
    generator: Unix Makefiles

sources:
- kind: git_tag
  url: github:ninja-build/ninja.git
  track: release
  ref: v1.11.1-0-ga524bf3f6bacd1b4ad85d719eed2737d8562f27a
