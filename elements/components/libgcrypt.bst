kind: autotools_recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
  ref: libgcrypt-1.12.1-0-g7e91b2a334d568297b7d81e05acd74e1d841b69d
