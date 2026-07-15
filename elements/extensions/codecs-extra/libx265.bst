# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

(@):
- elements/extensions/codecs-extra/config.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/_private/git-minimal.bst
- components/nasm.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-root: "source"

  arch-conf: ''
  (?):
  - target_arch in ("x86_64", "aarch64"):
      arch-conf: >-
        -DENABLE_ASSEMBLY=ON
        -DENABLE_HDR10_PLUS=TRUE
  - target_arch in ("i686", "riscv64"):
      arch-conf: >-
        -DENABLE_ASSEMBLY=OFF
        -DENABLE_HDR10_PLUS=TRUE
  - target_arch == "ppc64le":
      arch-conf: >-
        -DENABLE_ASSEMBLY=OFF
        -DENABLE_ALTIVEC=OFF
        -DCPU_POWER8=OFF
        -DENABLE_HDR10_PLUS=FALSE

  cmake-common: >-
    %{cmake-args}
    %{arch-conf}
    -DLIB_INSTALL_DIR="%{libdir}"
    -DENABLE_CLI=OFF

  cmake-hd-common: >-
    %{cmake-common}
    -DHIGH_BIT_DEPTH=TRUE
    -DEXPORT_C_API=FALSE
    -DENABLE_SHARED=FALSE

  cmake-hd-10: >-
    %{cmake-hd-common}

  cmake-hd-12: >-
    %{cmake-hd-common}
    -DMAIN12=TRUE

  cmake-final: >-
    %{cmake-common}
    -DENABLE_SHARED=TRUE
    -DEXTRA_LIB="x265_main10.a;x265_main12.a"
    -DEXTRA_LINK_FLAGS="-L%{build-root}/%{build-dir}"
    -DLINKED_10BIT=TRUE
    -DLINKED_12BIT=TRUE

config:
  configure-commands: []

  build-commands:
  - |
    cmake -B _builddir-12 -H"%{conf-root}" -G"%{generator}" %{cmake-hd-12}
    cmake --build _builddir-12 -- ${JOBS}

  - |
    cmake -B _builddir-10 -H"%{conf-root}" -G"%{generator}" %{cmake-hd-10}
    cmake --build _builddir-10 -- ${JOBS}

  - |
    mkdir -p %{build-dir}
    cp -vf _builddir-12/libx265.a %{build-dir}/libx265_main12.a
    cp -vf _builddir-10/libx265.a %{build-dir}/libx265_main10.a
    cmake -B %{build-dir} -H"%{conf-root}" -G"%{generator}" %{cmake-final}
    cmake --build %{build-dir} -- ${JOBS}

  install-commands:
    (>):
    - find "%{install-root}%{prefix}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: git_https:bitbucket.org/multicoreware/x265_git.git
  track: '*.*'
  exclude:
  - "*rc*"
  ref: 4.2-0-ge444744c03978c1fb4e037168967020cf2648427
- kind: patch
  path: patches/libx265/cstdint.patch
