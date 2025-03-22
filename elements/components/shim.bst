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
  ref: 16.0-0-g18d98bfb34be583a5fe2987542e4b15e0db9cb61
- kind: git_module
  url: github:rhboot/gnu-efi.git
  path: gnu-efi
  ref: 0d74e15af1ed17a7502829bef70b745287348e3d
