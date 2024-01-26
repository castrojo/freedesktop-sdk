kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/python3.bst

depends:
- bootstrap-import.bst
- components/spirv-headers.bst

variables:
  cmake-local: >-
    -DCMAKE_SKIP_RPATH:BOOL=yes
    -DSPIRV_WERROR=Off
    -DSPIRV-Headers_SOURCE_DIR="%{prefix}"
    -DSPIRV_TOOLS_BUILD_STATIC:BOOL=ON

  optimize-debug: "false"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/spirv-as'
        - '%{bindir}/spirv-cfg'
        - '%{bindir}/spriv-dis'
        - '%{bindir}/spirv-lesspipe.sh'
        - '%{bindir}/spirv-link'
        - '%{bindir}/spirv-opt'
        - '%{bindir}/spirv-stats'
        - '%{bindir}/spirv-val'

sources:
- kind: git_repo
  url: github:KhronosGroup/SPIRV-Tools.git
  track: vulkan-sdk-*
  ref: sdk-1.3.261.1-0-ge553b884c7c9febaa4e52334f683641fb5f196a0
- kind: patch
  path: patches/spirv-tools/Remove-libSPIRV-Tools-shared.so.patch
