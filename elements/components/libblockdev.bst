kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/cryptsetup.bst
- components/e2fsprogs.bst
- components/kmod.bst
- components/json-glib.bst
- components/libatasmart.bst
- components/libbytesize.bst
- components/libnvme.bst
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
  track: '*.*'
  ref: 3.2.1-0-gb829b60d9ff049abb190f09a3b9a5fac648cd5a3
