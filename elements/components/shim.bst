kind: make

build-depends:
- bootstrap-import.bst
- components/git-minimal.bst
- components/openssl.bst
- components/boot-keys.bst

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

config:
  configure-commands:
  - cp -ra /boot-keys .
  - |
    openssl x509 -inform PEM -outform DER -in "boot-keys/VENDOR.crt" -out "boot-keys/VENDOR.cer"

sources:
- kind: git_repo
  url: github:rhboot/shim.git
  track: "*.*"
  exclude:
  - "*rc*"
  ref: 15.8-0-g5914984a1ffeab841f482c791426d7ca9935a5e6
- kind: git_module
  url: github:rhboot/gnu-efi.git
  path: gnu-efi
  ref: 328951d3dcb5ff97f5a7c7a362b006626fada000
