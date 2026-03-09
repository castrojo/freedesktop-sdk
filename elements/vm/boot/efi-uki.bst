kind: uki_builder

build-depends:
- components/fakecap.bst
- components/systemd-ukify.bst
- vm/boot/efi/deps.bst
- vm/boot/efi/initial-scripts.bst
- vm/prepare-image.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  install-root: '/boot'

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

config:
  kernel-cmdline: "rw console=tty0 console=ttyS0 quiet"
