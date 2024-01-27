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
  command-subdir: spirv-tools

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

(@):
- elements/include/vulkan-stack.yml
