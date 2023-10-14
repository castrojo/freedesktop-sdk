kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/git-minimal.bst
- components/python3.bst

depends:
- components/glslang.bst
- components/spirv-tools.bst
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DSHADERC_SKIP_TESTS:BOOL=YES

config:
  configure-commands:
    (<):
    - |
      # Disable git versioning
      sed -i -e '/build-version/d' glslc/CMakeLists.txt

      # Manually create build-version.inc as we disabled git versioning
      cat <<EOF >glslc/src/build-version.inc
      "shaderc $(git describe | sed 's/^v//')"
      "spriv-tools $(spirv-cfg --version | sed '/^SPIRV-Tools v\([^ ]*\) .*$/{;s//\1/;q;};d')"
      "glslang $(glslangValidator --version | sed '/^Glslang Version: /{;s///;q;};d')"
      EOF

sources:
- kind: git_repo
  url: github:google/shaderc.git
  track: v*
  ref: v2023.7-0-g3882b16417077aa8eaa7b5775920e7ba4b8a224d
- kind: patch
  path: patches/shaderc/what-a-mess.patch
