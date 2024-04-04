kind: make

build-depends:
- bootstrap-import.bst
- components/git-minimal.bst

variables:
  (?):
  - target_arch == 'i686':
      efi-arch: ia32
  - target_arch == 'x86_64':
      efi-arch: x64
  - target_arch == 'aarch64':
      efi-arch: aa64
  - target_arch == 'riscv64':
      efi-arch: riscv64

  make-args: >-
    DEFAULT_LOADER='\\EFI\\systemd\\systemd-boot%{efi-arch}.efi'
    EFIDIR=freedesktopsdk
    ESPROOTDIR=boot/
    VENDOR_CERT_FILE=boot-keys/VENDOR.cer

  make: make %{make-args}
  make-install: make -j1 install %{make-args} DESTDIR='%{install-root}'

sources:
- kind: git_repo
  url: github:rhboot/shim.git
  track: '*.*'
  ref: 15.5-0-gf2c598bb2218da966872ba3e0c6e7e830dca6ef0
- kind: git_module
  url: github:rhboot/gnu-efi.git
  path: gnu-efi
  ref: acc5371207f3041450e1d8ae5b24f6df3e82b152
- kind: local
  path: files/boot-keys/VENDOR.cer
  directory: boot-keys
