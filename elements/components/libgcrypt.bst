kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libgpg-error.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/texinfo.bst
  type: build

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
  ref: libgcrypt-1.11.2-0-g737cc63600146f196738a6768679eb016cf866e9
