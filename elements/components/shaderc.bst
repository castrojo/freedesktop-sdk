kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/_private/git-minimal.bst
- components/grep.bst
- components/python3.bst
- components/spirv-tools.bst
- bootstrap/sed.bst

depends:
- components/glslang.bst
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -Dglslang_SOURCE_DIR="%{includedir}/glslang"
    -DSHADERC_SKIP_TESTS:BOOL=YES
    -DSHADERC_SKIP_EXAMPLES:BOOL=ON

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

  install-commands:
    (>):
    - |
      if ldd -r "%{install-root}%{libdir}/libshaderc_shared.so" 2>&1 | grep -q "^undefined symbol:"; then
          echo "Undefined symbols found in libshaderc_shared.so" >&2
          exit 1
      else
          echo "No undefined symbols found in libshaderc_shared.so"
      fi

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
  ref: v2026.1-0-g301b4ede53d59b68bf55f95bb26412d9233c8187
- kind: patch
  path: patches/shaderc/what-a-mess.patch
