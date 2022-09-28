kind: manual

build-depends:
- vm/boot/efi-secure.bst
- bootstrap-import.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}/usr/lib"
    cp -rT /usr/lib/modules "%{install-root}/usr/lib/modules"
