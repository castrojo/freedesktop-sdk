kind: autotools
description: util-linux

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: components/git-minimal.bst
  type: build

variables:
  conf-local: >-
    --without-python
    --disable-wall
    --disable-makeinstall-chown
    --disable-kill
    --disable-nologin
    --enable-usrdir-path

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      for i in mount umount; do
        chmod 4755 "${sysroot}%{bindir}/${i}"
      done

  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfdisk.so'
        - '%{libdir}/libblkid.so'
        - '%{libdir}/libsmartcols.so'
        - '%{libdir}/libmount.so'
        - '%{libdir}/libuuid.so'

      vm-linux:
      - '%{bindir}/mkfs*'
      - '%{bindir}/fsck*'
      - '%{bindir}/mkswap'
      - '%{bindir}/swapon'
      - '%{bindir}/swapoff'
      - '%{bindir}/mount'
      - '%{bindir}/umount'
      - '%{bindir}/pivot_root'
      - '%{bindir}/switch_root'

      - '%{bindir}/sulogin'
      - '%{bindir}/agetty'

      - '%{bindir}/sfdisk'
      - '%{bindir}/fdisk'
      - '%{bindir}/cfdisk'
      - '%{bindir}/partx'
      - '%{bindir}/addpart'
      - '%{bindir}/delpart'
      - '%{bindir}/resizepart'

      - '%{bindir}/blkdiscard'
      - '%{bindir}/blkzone'
      - '%{bindir}/wipefs'
      - '%{bindir}/fstrim'
      - '%{bindir}/fsfreeze'
      - '%{bindir}/losetup'
      - '%{bindir}/raw'

      - '%{bindir}/dmesg'

      - '%{libdir}/libfdisk.so*'

  cpe:
    ignored:
    - CVE-2001-1494

config:
  install-commands:
    (>):
    - |
      install -d -m0755 "%{install-root}%{bindir}"
      mv "%{install-root}%{prefix}/sbin"/* "%{install-root}%{bindir}/"
      rm -rf "%{install-root}%{prefix}/sbin"

sources:
- kind: git_tag
  url: kernel:utils/util-linux/util-linux.git
  track: stable/v2.37
  exclude:
  - v*-rc*
  ref: v2.37.4-0-g12f5423fc2ed08e1945fac95f3bdeb39bb915ea7
