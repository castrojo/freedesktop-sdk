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

      static-blocklist:
        (>):
        - "%{libdir}/*.a"

sources:
- kind: git_repo
  url: github:KhronosGroup/glslang.git
  track: vulkan-sdk-*
  ref: sdk-1.3.261.1-0-g76b52ebf77833908dc4c0dd6c70a9c357ac720bd
- kind: patch
  # Install several static libraries that shaderc needs
  # https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-util/glslang/files/glslang-1.3.236-Install-static-libs.patch
  path: patches/glslang/glslang-1.3.236-Install-static-libs.patch
