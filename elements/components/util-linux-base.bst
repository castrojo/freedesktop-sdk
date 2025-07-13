kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/asciidoctor.bst
- components/bash-completion.bst
- components/bison.bst
- components/flex.bst
- components/git-minimal.bst
- components/libcap-ng.bst
- components/libeconf.bst
- components/sed.bst

depends:
- components/file.bst
- components/sqlite.bst

variables:
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

      - '%{libdir}/libfdisk.so*'

      - '%{bindir}/setpriv'
  cpe:
    product: util-linux

config:
  install-commands:
    (>):
    - find "%{install-root}%{libdir}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: kernel:utils/util-linux/util-linux.git
  track: v*
  exclude:
  - v*-rc*
  - v*-devel*
  - v*-start*
  ref: v2.41.1-0-g67b6f19adad289cc4ff4071ae8eceda41bdce9e8
