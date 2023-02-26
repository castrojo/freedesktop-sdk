kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/python3.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DCMAKE_SKIP_RPATH:BOOL=yes
    -DBUILD_SHARED_LIBS:BOOL=yes

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}'
        - '%{bindir}/**'
        - '%{libdir}/libHLSL.so'
        - '%{libdir}/libSPIRV.so'
        - '%{libdir}/libSPVRemapper.so'
        - '%{libdir}/libglslang-default-resource-limits.so'
        - '%{libdir}/libglslang.so'

sources:
- kind: git_repo
  url: github:KhronosGroup/glslang.git
  track: sdk-*
  ref: sdk-1.3.216.0-0-gadbf0d3106b26daa237b10b9bf72b1af7c31092d
