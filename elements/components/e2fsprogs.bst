# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/util-linux-libs.bst
- public-stacks/runtime-minimal.bst

variables:
  license-files-extra: NOTICE
  # The `--disable-libuuid` and `--disable-libblkid` options are disabling the
  # *bundled* versions and enabling use of the system versions of these libs.
  conf-local: >-
    --enable-elf-shlibs
    --disable-fuse2fs
    --disable-libblkid
    --disable-libuuid
    --disable-fsck
    --disable-uuidd

  make-install: make -j1 DESTDIR="%{install-root}" LDCONFIG=true install install-libs

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/dumpe2fs"
      ln -s e2mmpstatus "%{install-root}%{bindir}/dumpe2fs"

    - |
      rm "%{install-root}%{bindir}/e2label"
      ln -s tune2fs "%{install-root}%{bindir}/e2label"

    - |
      for ext in ext2 ext3 ext4; do
        rm "%{install-root}%{bindir}/mkfs.${ext}"
        ln -s mke2fs "%{install-root}%{bindir}/mkfs.${ext}"
      done

    - |
      for ext in ext2 ext3 ext4; do
        rm "%{install-root}%{bindir}/fsck.${ext}"
        ln -s e2fsck "%{install-root}%{bindir}/fsck.${ext}"
      done

    - |
      find "%{install-root}" -name "lib*.a" -delete

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libss.so'
        - '%{libdir}/libcom_err.so'
        - '%{libdir}/libe2p.so'
        - '%{libdir}/libext2fs.so'
        - '%{datadir}/et'
        - '%{datadir}/et/**'

      vm-only:
      - '%{bindir}/*'

sources:
- kind: git_repo
  url: kernel:fs/ext2/e2fsprogs.git
  track: v*
  exclude:
  - v*rc*
  ref: v1.47.4-0-g7ee1d505ef3b37831215f490411f346fe57e9053
