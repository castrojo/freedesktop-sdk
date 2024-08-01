kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/python3.bst

depends:
- bootstrap-import.bst
- components/libffi.bst

variables:
  conf-root: llvm
  debug_flags: "-g1"
  optimize-debug: "false"

  (?):
  - target_arch == "i686":
      targets: X86;AMDGPU;NVPTX;BPF
  - target_arch == "x86_64":
      targets: X86;AMDGPU;NVPTX;BPF
  - target_arch == "aarch64":
      targets: AArch64;AMDGPU;BPF
  - target_arch in ("ppc64le", "ppc64"):
      targets: PowerPC;AMDGPU;BPF
  - target_arch == "riscv64":
      targets: RISCV;AMDGPU;BPF

  cmake-local: >-
    -DLLVM_ENABLE_PROJECTS='clang;compiler-rt'
    -DLLVM_ENABLE_ASSERTIONS:BOOL=OFF
    -DBUILD_SHARED_LIBS:BOOL=OFF
    -DLLVM_BUILD_LLVM_DYLIB:BOOL=ON
    -DLLVM_LINK_LLVM_DYLIB:BOOL=ON
    -DLLVM_LIBDIR_SUFFIX="/%{gcc_triplet}"
    -DLLVM_ENABLE_LIBCXX:BOOL=OFF
    -DLLVM_ENABLE_ZLIB:BOOL=ON
    -DLLVM_ENABLE_FFI:BOOL=ON
    -DLLVM_ENABLE_RTTI:BOOL=ON
    -DLLVM_INCLUDE_TESTS:BOOL=OFF
    -DLLVM_INCLUDE_EXAMPLES:BOOL=OFF
    -DLLVM_INCLUDE_UTILS:BOOL=ON
    -DLLVM_INSTALL_UTILS:BOOL=ON
    -DLLVM_INCLUDE_DOCS:BOOL=OFF
    -DLLVM_ENABLE_DOXYGEN:BOOL=OFF
    -DLLVM_BUILD_EXTERNAL_COMPILER_RT:BOOL=ON
    -DLLVM_BINUTILS_INCDIR=%{includedir}
    -DLLVM_INSTALL_TOOLCHAIN_ONLY:BOOL=OFF
    -DLLVM_TARGETS_TO_BUILD="%{targets}"
    -DCMAKE_SKIP_RPATH:BOOL=ON

sources:
- kind: git_repo
  url: github:llvm/llvm-project.git
  # https://github.com/intel/intel-graphics-compiler/issues/329#issuecomment-2107300756
  # intel-graphics-compiler only support old version of llvm(later needs update)
  track: llvmorg-14.*
  exclude:
  - llvmorg-*-rc*
  - llvmorg-*-init*
  ref: llvmorg-14.0.6-0-gf28c006a5895fc0e329fe15fead81e37457cb1d1

