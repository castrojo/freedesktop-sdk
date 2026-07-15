# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/_private/git-minimal.bst
- components/asciidoctor.bst
- components/bash-completion.bst
- components/bison.bst
- components/flex.bst
- components/gawk.bst
- components/libcap-ng.bst
- components/libeconf.bst
- components/perl-yaml-tiny.bst
- components/po4a.bst
- components/sed.bst

depends:
- components/file.bst
- components/sqlite.bst

variables:
  license-files-extra: README.licensing
  meson-local: >-
    -Dncurses=disabled
    -Dlibuser=disabled
    -Dlibutempter=disabled
    -Dsystemd=disabled
    -Dbuild-login=disabled
    -Dbuild-chfn-chsh=disabled
    -Dbuild-su=disabled
    -Dbuild-runuser=disabled
    -Dcryptsetup=disabled
    -Dbuild-pam-lastlog2=disabled
    -Dbuild-kill=disabled
    -Dbuild-wall=disabled
    -Dbuild-nologin=disabled
    -Dbuild-line=disabled
    -Dbuild-newgrp=disabled
    -Dbuild-pg=disabled
    -Dbuild-tunelp=disabled
    -Dbuild-vipw=disabled
    -Dbuild-write=disabled
    -Dbuild-python=disabled
    -Dvendordir="%{indep-libdir}"
    -Dprogram-tests=false

  # The dwz optimised debug info is a single file. Since util-linux is split
  # into multiple elements, disable dwz.
  optimize-debug: False

config:
  install-commands:
    (>):
    - find "%{install-root}%{libdir}" -name "lib*.a" -delete

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
      libblkid:
      - '%{debugdir}%{libdir}/libblkid.so*'
      - '%{includedir}/blkid/**'
      - '%{libdir}/libblkid.so*'
      - '%{libdir}/pkgconfig/blkid.pc'
      - '%{project_licensedir}/util-linux/libblkid/**'
      - '%{sourcedir}/%{element-name}/_builddir/libblkid/**'
      - '%{sourcedir}/%{element-name}/libblkid/**'
      - '%{mandir}/man3/libblkid.*'
      - '%{mandir}/*/man3/libblkid.*'
      liblastlog2:
      - '%{debugdir}%{libdir}/liblastlog2.so*'
      - '%{includedir}/liblastlog2/**'
      - '%{libdir}/liblastlog2.so*'
      - '%{libdir}/pkgconfig/lastlog2.pc'
      - '%{project_licensedir}/util-linux/liblastlog2/**'
      - '%{sourcedir}/%{element-name}/_builddir/liblastlog2/**'
      - '%{sourcedir}/%{element-name}/liblastlog2/**'
      - '%{mandir}/man3/lastlog2.*'
      - '%{mandir}/man3/ll2_*.*'
      - '%{mandir}/*/man3/lastlog2.*'
      - '%{mandir}/*/man3/ll2_*.*'
      libfdisk:
      - '%{debugdir}%{libdir}/libfdisk.so*'
      - '%{includedir}/libfdisk/**'
      - '%{libdir}/libfdisk.so*'
      - '%{libdir}/pkgconfig/fdisk.pc'
      - '%{project_licensedir}/util-linux/libfdisk/**'
      - '%{sourcedir}/%{element-name}/_builddir/libfdisk/**'
      - '%{sourcedir}/%{element-name}/libfdisk/**'
      libmount:
      - '%{debugdir}%{libdir}/libmount.so*'
      - '%{includedir}/libmount/**'
      - '%{libdir}/libmount.so*'
      - '%{libdir}/pkgconfig/mount.pc'
      - '%{project_licensedir}/util-linux/libmount/**'
      - '%{sourcedir}/%{element-name}/_builddir/libmount/**'
      - '%{sourcedir}/%{element-name}/libmount/**'
      libsmartcols:
      - '%{debugdir}%{libdir}/libsmartcols.so*'
      - '%{includedir}/libsmartcols/**'
      - '%{libdir}/libsmartcols.so*'
      - '%{libdir}/pkgconfig/smartcols.pc'
      - '%{project_licensedir}/util-linux/libsmartcols/**'
      - '%{sourcedir}/%{element-name}/_builddir/libsmartcols/**'
      - '%{sourcedir}/%{element-name}/libsmartcols/**'
      libuuid:
      - '%{debugdir}%{libdir}/libuuid.so*'
      - '%{includedir}/uuid/**'
      - '%{libdir}/libuuid.so*'
      - '%{libdir}/pkgconfig/uuid.pc'
      - '%{project_licensedir}/util-linux/libuuid/**'
      - '%{sourcedir}/%{element-name}/libuuid/**'
      - '%{mandir}/man3/uuid.*'
      - '%{mandir}/man3/uuid_*.*'
      - '%{mandir}/*/man3/uuid.*'
      - '%{mandir}/*/man3/uuid_*.*'
      util-linux-license:
      - "%{project_licensedir}"
      - "%{project_licensedir}/**"
      vm-tools:
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
      - '%{bindir}/lslogins'

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

      - '%{bindir}/setpriv'
  cpe:
    product: util-linux

sources:
- kind: git_repo
  url: kernel:utils/util-linux/util-linux.git
  track: v*
  exclude:
  - v*-rc*
  - v*-devel*
  - v*-start*
  ref: v2.42.2-0-gf44509230b9f8224993b8c6157f85888359a64e1
