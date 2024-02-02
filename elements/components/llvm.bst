kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/python3.bst

depends:
- bootstrap-import.bst
- components/libffi.bst

environment:
  # Work-around issue building compiler-rt with multiarch
  LD_LIBRARY_PATH: '%{build-root}/%{build-dir}/lib/%{gcc_triplet}'

variables:
  conf-root: llvm

  debug_flags: "-g1"
  optimize-debug: "false"

  (?):
  - target_arch == "i686":
      targets: X86;AMDGPU;NVPTX;BPF
  - target_arch == "x86_64":
      targets: X86;AMDGPU;NVPTX;BPF
  - target_arch == "arm":
      targets: ARM;BPF
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
    -DLLVM_DEFAULT_TARGET_TRIPLE=%{build-triplet}
    -DLLVM_TARGETS_TO_BUILD="%{targets}"
    -DCMAKE_SKIP_RPATH:BOOL=ON

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/llvm"
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/clang"
      mv "%{install-root}%{includedir}/llvm/Config" "%{install-root}%{includedir}/%{gcc_triplet}/llvm/"
      mv "%{install-root}%{includedir}/clang/Config" "%{install-root}%{includedir}/%{gcc_triplet}/clang/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}'
        - '%{bindir}/**'
        - '%{datadir}'
        - '%{datadir}/**'
        - '%{libexecdir}'
        - '%{libexecdir}/**'
        - '%{libdir}/clang'
        - '%{libdir}/clang/**'
        - '%{libdir}/libLLVM.so'
        - '%{libdir}/libLLVM-*.*.*.so'
        - '%{libdir}/libclang-cpp.so'
        - '%{libdir}/libclang.so'
        - '%{libdir}/LLVMgold.so'
        - '%{libdir}/libLTO.so'
        - '%{libdir}/libRemarks.so'

      static-blocklist:
        (>):
        - '%{includedir}/lld'
        - '%{includedir}/lld/**'
        - '%{libdir}/**/*.a.syms'
        - "%{libdir}/*.a"
        - "%{libdir}/**/*.a"
        - "%{indep-libdir}/**/*.a"

  cpe:
    product: llvm

(@): elements/include/llvm.yml
