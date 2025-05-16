kind: cmake

(@): elements/extensions/codecs-extra/config.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/nasm.bst
- components/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-root: "source"

  arch-conf: ''
  (?):
  - target_arch in ("x86_64", "aarch64", "riscv64"):
      arch-conf: >-
        -DENABLE_HDR10_PLUS=TRUE
  - target_arch == "i686":
      arch-conf: >-
        -DENABLE_HDR10_PLUS=TRUE
  - target_arch == "ppc64le":
      arch-conf: >-
        -DENABLE_HDR10_PLUS=FALSE

  cmake-common: >-
    %{cmake-args}
    %{arch-conf}
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
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
  ref: 4.1-0-g1d117bed4747758b51bd2c124d738527e30392cb
- kind: patch
  path: patches/libx265/cmakev4.patch
- kind: patch
  path: patches/libx265/cstdint.patch
