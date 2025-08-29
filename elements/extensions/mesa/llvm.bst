kind: manual

(@):
- elements/extensions/mesa/config.yml

build-depends:
- bootstrap/binutils.bst
- bootstrap/sed.bst
- components/llvm.bst
- components/spirv-llvm-translator.bst
- public-stacks/runtime-minimal.bst

variables:
  libraries: >-
    libLLVM.so
    libclang-cpp.so
    libLLVMSPIRVLib.so

config:
  install-commands:
  - |
    for lib in %{libraries}; do
      real_lib=$(objdump -p "/usr/lib/%{gcc_triplet}/${lib}"  | sed '/^ *SONAME */{;s///;q;};d')
      install -Dm644 -t '%{install-root}%{libdir}' "/usr/lib/%{gcc_triplet}/${real_lib}"
    done
  - |
    %{install-extra}

  # Strip was already done
  strip-commands: []

