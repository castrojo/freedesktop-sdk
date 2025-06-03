kind: make

description: |
  This element should be consumed through shim-maybe.bst
  as this is specific to select arches. The efi-arch variable is set
  as a stub to enable tracking

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
  efi-arch: "none"
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
    VENDOR_CERT_FILE=boot-keys/VENDOR.cer

  make: make %{make-args}
  make-install: make install %{make-args} DESTDIR='%{install-root}'

config:
  configure-commands:
  - |
    if [ "%{efi-arch}" == "none" ]; then
      echo "Unsupported arch, use shim-maybe"
      exit 1
    fi

  - cp -ra /boot-keys .
  - |
    openssl x509 -inform PEM -outform DER -in "boot-keys/VENDOR.crt" -out "boot-keys/VENDOR.cer"

sources:
- kind: git_repo
  url: github:rhboot/shim.git
  track: "*.*"
  exclude:
  - "*rc*"
  - "16.0"
  ref: 15.8-0-g5914984a1ffeab841f482c791426d7ca9935a5e6
- kind: git_module
  url: github:rhboot/gnu-efi.git
  path: gnu-efi
  ref: 328951d3dcb5ff97f5a7c7a362b006626fada000
