kind: make

description: |
  This element should be consumed through shim-maybe.bst
  as this is specific to select arches. The efi-arch variable is set
  as a stub to enable tracking

build-depends:
- public-stacks/buildsystem-make.bst
- components/git-minimal.bst
- components/openssl.bst
- components/sbsigntools.bst

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
  efi-arch: "none"
  fdsdk-keys-uuid: 3eaca6a1-86fa-4580-9487-cccae358e9e4
  (?):
  - target_arch == 'i686':
      efi-arch: ia32
  - target_arch == 'x86_64':
      efi-arch: x64
  - target_arch == 'aarch64':
      efi-arch: aa64
  - target_arch == 'riscv64':
      efi-arch: riscv64

  notparallel: true

  make-args: >-
    DEFAULT_LOADER='\\EFI\\systemd\\systemd-boot%{efi-arch}.efi'
    EFIDIR=freedesktopsdk
    ESPROOTDIR=boot/
    VENDOR_DB_FILE=VENDOR.esl

config:
  configure-commands:
  - |
    if [ "%{efi-arch}" == "none" ]; then
      echo "Unsupported arch, use shim-maybe"
      exit 1
    fi

  - cp -ra /boot-keys .
  - |
    openssl x509 -inform PEM -outform DER -in /boot-keys/VENDOR.crt -out VENDOR.cer
  - |
    sbsiglist --owner '%{fdsdk-keys-uuid}' --type x509 --output VENDOR.esl VENDOR.cer

sources:
- kind: git_repo
  url: github:rhboot/shim.git
  track: "*.*"
  exclude:
  - "*rc*"
  - "16.0"
  ref: 16.1-0-gafc49558b34548644c1cd0ad1b6526a9470182ed
- kind: git_repo
  url: github:rhboot/gnu-efi.git
  directory: gnu-efi
  # branch shim-16.1
  ref: shim-16.0-pr660-1-gdc7fd96f23d6b582416f672844362d776d175cf4
