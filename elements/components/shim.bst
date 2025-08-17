kind: make

build-depends:
- bootstrap-import.bst
- components/git-minimal.bst
- components/openssl.bst

(?):
- not prod_keys:
    build-depends:
      (>):
      - components/boot-keys-test.bst
- prod_keys:
    build-depends:
      (>):
      - components/boot-keys-prod.bst

variables:
  notparallel: true

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
  ref: 16.1-0-gafc49558b34548644c1cd0ad1b6526a9470182ed
- kind: git_repo
  url: github:rhboot/gnu-efi.git
  directory: gnu-efi
  # branch shim-16.1
  ref: shim-16.0-pr660-1-gdc7fd96f23d6b582416f672844362d776d175cf4
