kind: script

build-depends:
- components/ostree.bst
- vm/deploy-tools.bst
- vm/prepare-image.bst
- vm/minimal-ostree/initial-scripts.bst
- filename: vm/minimal-ostree/filesystem.bst
  config:
    location: '/sysroot'

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6

  (@):
  - ostree-config.yml

environment:
  OSTREE_REPO: "%{install-root}/ostree/repo"

config:

  commands:
  - mkdir -p /tmp
  - mkdir -p /efi
  - |
    prepare-image.sh \
       --sysroot /sysroot \
       --seed "%{uuidnamespace}" \
       --rootsource /dev/gpt-auto-root \
        --efisource LABEL=EFI \
       --efipath /boot \
       --rootpasswd "root" >"%{install-root}/vars"

  - mkdir -p "${OSTREE_REPO}"
  - ostree init --repo="${OSTREE_REPO}" --mode=archive
  - mv /sysroot/etc /sysroot/usr/etc
  - ostree commit --branch=%{ostree-branch} /sysroot
