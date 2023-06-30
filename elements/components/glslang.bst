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
  track: sdk-*
  ref: sdk-1.3.250.1-0-g3ebb72cc7429f0ab8218104dc3687c659c0f364d
- kind: patch
  # Install several static libraries that shaderc needs
  # https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-util/glslang/files/glslang-1.3.236-Install-static-libs.patch
  path: patches/glslang/glslang-1.3.236-Install-static-libs.patch
