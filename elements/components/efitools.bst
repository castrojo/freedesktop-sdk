kind: make

build-depends:
- components/gnu-efi.bst
- components/help2man.bst
- components/perl-slurp.bst

depends:
- bootstrap-import.bst
- components/openssl.bst
- components/sbsigntools.bst

variables:
  fdsdk-keys-uuid: 3eaca6a1-86fa-4580-9487-cccae358e9e4
  notparallel: true
  make-args: >-
    PREFIX='%{prefix}'
    CRTPATHS='%{libdir}'
    EXTRAKEYS=''
    EXTERNALKEYS=''
    KEYUPDATEAUTH=''
    KEYBLACKLISTAUTH=''
    KEYHASHBLACKLISTAUTH=''
    MYGUID=%{fdsdk-keys-uuid}

config:
  install-commands:
    (>):
    - |
      install -Dm644 -t '%{install-root}%{datadir}/efitools/efi' *-signed.efi

    - |
      install -Dm644 -t '%{install-root}%{datadir}/efitools/efi' {PK,KEK,DB}.auth

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/jejb/efitools.git
  track: master
  ref: v1.9.2-0-g392836a46ce3c92b55dc88a1aebbcfdfc5dcddce
- kind: local
  path: files/boot-keys/PK.key
- kind: local
  path: files/boot-keys/PK.crt
- kind: local
  path: files/boot-keys/KEK.key
- kind: local
  path: files/boot-keys/KEK.crt
- kind: local
  path: files/boot-keys/DB.key
- kind: local
  path: files/boot-keys/DB.crt
