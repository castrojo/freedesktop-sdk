# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

(@):
- elements/include/vulkan-stack.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  license-files-extra: glslang/LICENSE.txt
  # pre-compiled headers cause non-reproducible builds, so disable them.
  # see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=126707
  cmake-local: >-
    -DENABLE_PCH="OFF"
    -DCMAKE_SKIP_RPATH:BOOL=yes
    -DBUILD_SHARED_LIBS:BOOL=yes
    -DENABLE_OPT="OFF"
  command-subdir: glslang

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
