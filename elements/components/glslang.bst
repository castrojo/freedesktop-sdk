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
  ref: sdk-1.3.250.0-0-gd1517d64cfca91f573af1bf7341dc3a5113349c0
- kind: patch
  # Install several static libraries that shaderc needs
  # https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-util/glslang/files/glslang-1.3.236-Install-static-libs.patch
  path: patches/glslang/glslang-1.3.236-Install-static-libs.patch
