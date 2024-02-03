kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/python3.bst
- components/spirv-tools.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DCMAKE_SKIP_RPATH:BOOL=yes
    -DBUILD_SHARED_LIBS:BOOL=yes
    -DALLOW_EXTERNAL_SPIRV_TOOLS:BOOL=yes
  command-subdir: glslang

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

      static-blocklist:
        (>):
        - "%{libdir}/*.a"

(@):
- elements/include/vulkan-stack.yml

