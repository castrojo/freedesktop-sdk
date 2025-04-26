kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoctor.bst
- components/bison.bst
- components/flex.bst
- components/git-minimal.bst
- components/libcap-ng.bst
- components/libeconf.bst

depends:
- components/file.bst
- components/sqlite.bst

variables:
  conf-local: >-
    --without-python
    --disable-wall
    --disable-makeinstall-chown
    --disable-kill
    --disable-nologin
    --enable-usrdir-path
    --enable-setpriv
    --with-econf
    --with-vendordir="%{indep-libdir}"

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
    - |
      install -d -m0755 "%{install-root}%{bindir}"
      mv "%{install-root}%{prefix}/sbin"/* "%{install-root}%{bindir}/"
      rm -rf "%{install-root}%{prefix}/sbin"

sources:
- kind: git_repo
  url: kernel:utils/util-linux/util-linux.git
  track: v*
  exclude:
  - v*-rc*
  - v*-devel*
  - v*-start*
  ref: v2.41-0-gcaa26876bc75041833c9644491cc2670d623f750
