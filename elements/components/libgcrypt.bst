kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libgpg-error.bst

variables:
  conf-local: >-
    --enable-maintainer-mode
    --disable-doc
    %{asm}
  asm: --enable-asm
  (?):
    - target_arch == "riscv64":
        # Enabling asm uses vector instructions which might not always work,
        # causing SIGILL
        asm: --disable-asm

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/libgcrypt-config'
        - '%{libdir}/libgcrypt.so'

sources:
- kind: git_repo
  url: gnupg:libgcrypt.git
  track: libgcrypt-*
  ref: libgcrypt-1.11.1-0-g81ce5321b1b79bde6dfdc3c164efb40c13cf656b
