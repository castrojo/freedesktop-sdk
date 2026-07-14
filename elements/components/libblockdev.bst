# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/cryptsetup.bst
- components/e2fsprogs.bst
- components/json-glib.bst
- components/kmod.bst
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
  ref: 3.5.0-0-g065d6910a0e915dbe633356da7bad9c4b3a2e2b9
