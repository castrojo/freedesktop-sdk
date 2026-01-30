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
  url: github:gpg/libgcrypt.git
  track: libgcrypt-*
  ref: libgcrypt-1.12.0-0-gefd5e1e7b4e7861b53eafdbf197fd6d4ff6f45e1
