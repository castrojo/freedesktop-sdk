kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/git-minimal.bst
- components/python3.bst
- components/spirv-tools.bst

depends:
- bootstrap-import.bst
- components/glslang.bst

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

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}'
        - '%{bindir}/**'
        - '%{libdir}/libshaderc_shared.so'
      static-blocklist:
        (>):
        - "%{libdir}/*.a"

sources:
- kind: git_repo
  url: github:google/shaderc.git
  track: v*
  ref: v2024.2-0-g3ac03b8ad85a8e328a6182cddee8d05810bd5a2c
- kind: patch
  path: patches/shaderc/what-a-mess.patch
