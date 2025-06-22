kind: cmake

(@):
- elements/include/llvm.yml

build-depends:
- components/cmake-stage1.bst
- components/gcc.bst
- components/gettext.bst
- components/ninja.bst
- components/pkg-config.bst
- components/python3-minimal.bst
- components/stripper.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libffi.bst
- components/zstd.bst

environment:
  # Work-around issue building compiler-rt with multiarch
  LD_LIBRARY_PATH: '%{build-root}/%{build-dir}/lib/%{gcc_triplet}'

variables:
  conf-root: llvm

  debug_flags: "-g1"
  optimize-debug: "false"
  enabled-projects: "clang;compiler-rt;lld"

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
  - target_arch == "loongarch64":
      targets: LoongArch;AMDGPU;BPF

  cmake-local: >-
    -DLLVM_ENABLE_PROJECTS='%{enabled-projects}'
    -DLLVM_ENABLE_ASSERTIONS:BOOL=OFF
    -DBUILD_SHARED_LIBS:BOOL=OFF
    -DLLVM_BUILD_LLVM_DYLIB:BOOL=ON
    -DLLVM_LINK_LLVM_DYLIB:BOOL=ON
    -DLLVM_LIBDIR_SUFFIX="/%{gcc_triplet}"
    -DLLVM_ENABLE_LIBCXX:BOOL=OFF
    -DLLVM_ENABLE_ZLIB:BOOL=ON
    -DLLVM_ENABLE_ZSTD=ON
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
