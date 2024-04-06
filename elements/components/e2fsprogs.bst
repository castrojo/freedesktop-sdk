kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/util-linux.bst
- components/fuse.bst

variables:
  conf-local: >-
    --enable-elf-shlibs
    --enable-fuse2fs
    --disable-libblkid
    --disable-libuuid
    --disable-fsck
    --disable-uuidd

  make-install: make -j1 DESTDIR="%{install-root}" install install-libs

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
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libss.so'
        - '%{libdir}/libcom_err.so'
        - '%{libdir}/libe2p.so'
        - '%{libdir}/libext2fs.so'

      vm-only:
      - '%{bindir}/*'

sources:
- kind: git_repo
  url: kernel:fs/ext2/e2fsprogs.git
  track: v*
  ref: v1.47.0-0-g25ad8a431331b4d1d444a70b6079456cc612ac40
- kind: patch
  path: patches/e2fsprogs/reproducible.patch
