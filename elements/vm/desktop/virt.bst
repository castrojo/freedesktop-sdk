kind: script

build-depends:
- vm/desktop/initial-scripts.bst
- vm/prepare-image.bst
- filename: vm/desktop/filesystem.bst
  config:
    location: '/sysroot'

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  install-root: /sysroot

config:

  commands:
  - |
    mkdir -p /tmp
    prepare-image.sh --rootpasswd root --seed "%{uuidnamespace}" \
                     --sysroot /sysroot \
                     --noboot \
                     --rootfstype 9p \
                     --rootsource virtfs \
                     >/tmp/vars
