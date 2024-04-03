kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

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
- kind: git_tag
  url: github:storaged-project/libblockdev.git
  track: master
  track-extra:
  - 2.x-branch
  ref: 3.1.0-1-0-g65f50bf912374b85d673f2716ea0c8306980c95b
