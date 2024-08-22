kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- extensions/platform-hip/hipcc.bst
- extensions/platform-hip/comgr.bst
- extensions/platform-hip/rocr.bst
- extensions/platform-hip/roct.bst
- extensions/platform-hip/rocm-llvm.bst
- components/mesa-headers.bst
- components/numactl.bst
- components/perl.bst
- components/python3-cppheaderparser.bst
- extensions/clinfo/clinfo.bst # For openCL

config:
  configure-commands:
  - |
    export CLR_DIR="%{build-root}/clr"
    export HIP_DIR="%{build-root}/HIP"
    %{cmake}

variables:
  conf-root: $CLR_DIR

  cmake-local: >-
    -DCLR_BUILD_HIP=ON
    -DHIP_COMMON_DIR=$HIP_DIR
    -DHIPCC_BIN_DIR=%{bindir}
    -DCLR_BUILD_OCL=ON
    -DSHARED_LIBS=ON
    -DHIP_LLVM_ROOT=%{prefix}
    -DHIP_ENABLE_ROCPROFILER_REGISTER=OFF

sources:
- kind: git_repo
  url: github:ROCm/clr.git
  directory: clr
  track: rocm-*
  ref: rocm-6.2.0-0-gdd7f9576620569fc8847cef767efcc1f4bab9d1a
- kind: git_repo
  url: github:ROCm/HIP.git
  directory: HIP
  track: rocm-*
  ref: rocm-6.2.0-0-g50ec90c65cc383f676c099ecb0546e183851f6b1
