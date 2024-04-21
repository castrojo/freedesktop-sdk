kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/e2fsprogs.bst
- components/keyutils.bst
- components/libnvme.bst

depends:
- components/cryptsetup.bst
- components/kmod.bst
- components/libbytesize.bst
- components/libyaml.bst
- components/lvm2.bst
- components/mdadm.bst
- components/parted.bst
- components/systemd.bst
- components/volume-key.bst

variables:
  conf-local: >-
    --without-dmraid
    --without-nvdimm
    --with-mdraid
  local_flags: >-
    -Wno-error

sources:
- kind: git_repo
  url: github:storaged-project/libblockdev.git
  track: '*.*.*'
  ref: 3.1.1-1-0-g68aaff5556afe26be749c29a2b7cbd714dce3050
