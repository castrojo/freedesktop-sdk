# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-source.yml

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/grep.bst
- bootstrap/sed.bst
- components/_private/buildsystem-cmake.bst
- components/_private/python3-minimal.bst
- components/_private/rust-stage1.bst

depends:
- public-stacks/runtime-minimal.bst
- components/curl.bst
- components/libxml2.bst
- components/llvm.bst
- components/openssl.bst

environment:
  MAXJOBS: '%{max-jobs}'

environment-nocache:
- MAXJOBS

variables:
  optimize-debug: "false"
  rust_debug_flags: ""
  debuginfo-level-std: '1'
  rust-target: '%{host-triplet}'
  build-docs: 'false'
  (?):
  - target_arch == "i686":
      llvm-targets: 'X86'
  - target_arch == "x86_64":
      llvm-targets: 'X86'
  - target_arch == "aarch64":
      llvm-targets: 'AArch64'
  - target_arch == "ppc64le":
      llvm-targets: 'PowerPC'
  - target_arch == "riscv64":
      rust-target: 'riscv64gc-unknown-linux-gnu'
      llvm-targets: 'RISCV'
      build-docs: 'false'
  - target_arch == "loongarch64":
      llvm-targets: 'LoongArch'
      build-docs: 'false'

config:
  configure-commands:
  - |
    cat <<EOF >config.toml
    [llvm]
    download-ci-llvm = false
    link-shared = true
    targets = "%{llvm-targets}"
    # disable experimental targets, we certainly don't want them (only AVR at the moment)
    experimental-targets = ""
    [build]
    build = "%{rust-target}"
    host = ["%{rust-target}"]
    target = ["%{rust-target}"]
    cargo = "/usr/bin/cargo"
    rustc = "/usr/bin/rustc"
    docs = %{build-docs}
    submodules = false
    python = "/usr/bin/python3"
    locked-deps = true
    vendor = true
    verbose = 2
    extended = true
    tools = ["cargo", "rustdoc", "rustfmt", "analysis"]
    [install]
    prefix = "%{prefix}"
    sysconfdir = "%{sysconfdir}"
    bindir = "%{bindir}"
    libdir = "%{indep-libdir}"
    datadir = "%{datadir}"
    mandir = "%{mandir}"
    docdir = "%{datadir}/doc/rust"
    [rust]
    optimize = true
    channel = "stable"
    debuginfo-level-std = %{debuginfo-level-std}
    backtrace = true
    rpath = false
    lto = "off"
    use-lld = true
    lld = false
    default-linker = "/usr/bin/clang"
    [target.%{rust-target}]
    cc = "/usr/bin/%{host-triplet}-gcc"
    cxx = "/usr/bin/%{host-triplet}-g++"
    linker = "/usr/bin/clang"
    ar = "/usr/bin/%{host-triplet}-gcc-ar"
    llvm-config = "/usr/bin/llvm-config"
    EOF

  build-commands:
  - |
    python3 x.py build -j${MAXJOBS}

  install-commands:
  - |
    DESTDIR="%{install-root}" python3 x.py -j1 install

  - |
    mkdir -p %{install-root}%{libdir}
    mv -v %{install-root}%{indep-libdir}/lib*so* %{install-root}%{libdir}

  - |
    rustlibdir="%{install-root}%{indep-libdir}/rustlib/%{host-triplet}/lib"
    for lib in "${rustlibdir}/"lib*.so; do
      libname=$(basename "${lib}")
      runtimelib="%{install-root}%{libdir}/${libname}"
      if [ -f "${runtimelib}" ]; then
        rm "${lib}"
        ln -s "$(realpath "${runtimelib}" --relative-to="${rustlibdir}")" "${lib}"
      fi
    done

  - |
    %{install-extra}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/*'
        - '%{indep-libdir}/rustlib'
        - '%{indep-libdir}/rustlib/**'
