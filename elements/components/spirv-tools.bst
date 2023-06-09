kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
- components/spirv-headers.bst

variables:
  cmake-local: >-
    -DCMAKE_SKIP_RPATH:BOOL=yes
    -DSPIRV_WERROR=Off
    -DSPIRV-Headers_SOURCE_DIR=/usr
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DSPIRV_TOOLS_BUILD_STATIC:BOOL=NO

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
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Tools.git
  track: sdk-1.2.198
  match:
  - sdk-*
  ref: sdk-1.2.198.0-0-g21e3f681e2004590c7865bc8c0195a4ab8e66c88
