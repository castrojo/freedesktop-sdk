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
- kind: git_repo
  url: github:KhronosGroup/SPIRV-Tools.git
  track: sdk-*
  ref: sdk-1.3.246.1-0-g44d72a9b36702f093dd20815561a56778b2d181e
