kind: manual

build-depends:
- components/llvm.bst
- components/spirv-llvm-translator.bst
- bootstrap-import.bst

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

(@):
- elements/extensions/mesa/config.yml

