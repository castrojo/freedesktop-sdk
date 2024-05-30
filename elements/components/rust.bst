kind: manual

depends:
- bootstrap-import.bst
- components/llvm.bst
- components/libxml2.bst
- components/openssl.bst

build-depends:
- components/rust-stage1.bst
- public-stacks/buildsystem-cmake.bst
- components/python3.bst

variables:
  optimize-debug: "false"

  debuginfo-level-std: '1'
  rust-target: '%{host-triplet}'
  llvm-targets: 'AArch64;ARM;Hexagon;MSP430;Mips;NVPTX;PowerPC;Sparc;SystemZ;WebAssembly;X86'
  build-docs: 'true'
  (?):
  - target_arch == "i686":
      llvm-targets: 'X86'
  - target_arch == "x86_64":
      llvm-targets: 'X86'
  - target_arch == "arm":
      rust-target: armv7-unknown-linux-gnueabihf
      llvm-targets: 'ARM'
  - target_arch == "aarch64":
      llvm-targets: 'AArch64'
  - target_arch == "ppc64le":
      llvm-targets: 'PowerPC'
  - target_arch == "riscv64":
      rust-target: 'riscv64gc-unknown-linux-gnu'
      llvm-targets: 'RISCV'
      build-docs: 'false'

environment-nocache:
- MAXJOBS

environment:
  MAXJOBS: '%{max-jobs}'

config:
  configure-commands:
  - |
    cat <<EOF >config.toml
    [llvm]
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
    tools = ["cargo"]
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
    default-linker = "/usr/bin/gcc"
    [target.%{rust-target}]
    cc = "/usr/bin/%{host-triplet}-gcc"
    cxx = "/usr/bin/%{host-triplet}-g++"
    linker = "/usr/bin/%{host-triplet}-gcc"
    ar = "/usr/bin/%{host-triplet}-gcc-ar"
    llvm-config = "/usr/bin/llvm-config"
    EOF

  build-commands:
  - |
    python3 x.py build -j${MAXJOBS}

  install-commands:
  - |
    DESTDIR="%{install-root}" python3 x.py install

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

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/*'
        - '%{indep-libdir}/rustlib'
        - '%{indep-libdir}/rustlib/**'

sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rustc-1.78.0-src.tar.xz
  ref: 8065824f0255faa3901db8206e6f9423f6f8c07cec28bc6f2797c6c948310ece
