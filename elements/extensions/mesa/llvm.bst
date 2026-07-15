# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/extensions/mesa/config.yml

build-depends:
- public-stacks/runtime-minimal.bst
- bootstrap/binutils.bst
- bootstrap/sed.bst
- components/llvm.bst
- components/spirv-llvm-translator.bst

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
    resource_dir="$(clang -print-resource-dir)"
    clang_version="$(basename "${resource_dir}")"

    src_path="${resource_dir}/include"
    dest_path="%{install-root}%{prefix}/%{lib}/%{gcc_triplet}/clang/${clang_version}/include"

    mkdir -p "${dest_path}"

    echo "Copying clang headers from $src_path to $dest_path for rusticl"
    cp -avf "${src_path}/." "${dest_path}/"

    test -f "${dest_path}/opencl-c-base.h"

  - |
    %{install-extra}
    mkdir -p "%{install-root}%{project_licensedir}"
    cp -rv "/usr/share/licenses/freedesktop-sdk/llvm" "%{install-root}%{project_licensedir}"

  # Strip was already done
  strip-commands: []
