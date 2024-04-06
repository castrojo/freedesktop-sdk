kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DCMAKE_SKIP_RPATH:BOOL=yes
    -DBUILD_SHARED_LIBS:BOOL=yes

config:
  install-commands:
    (>):
    - rm %{install-root}/%{libdir}/libMachineIndependent.a
    - rm %{install-root}/%{libdir}/libGenericCodeGen.a

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
        - '%{datadir}/glslang/*.cmake'

sources:
- kind: git_repo
  url: github:KhronosGroup/glslang.git
  ref: sdk-1.3.224.1-0-g10423ec659d301a0ff2daac8bbf38980abf27590
