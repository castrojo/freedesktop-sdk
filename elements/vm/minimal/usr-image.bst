kind: script

build-depends:
- vm/deploy-tools.bst
- snap-images/squashfs-tools.bst
- vm/minimal/initial-scripts.bst
- vm/prepare-image.bst
- filename: vm/minimal/filesystem.bst
  config:
    location: '/sysroot'

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  salt: 5ceca5e1f86ae62403b27e66c5160717f1bb88405a1d1d0853241c27f3764843

config:
  commands:
  - |
    prepare-image.sh \
       --sysroot /sysroot \
       --seed "%{uuidnamespace}" \
       --rootpasswd "root" > '%{install-root}/vars.txt'

  - |
    mkdir -p /sysroot/usr/share/factory
    mv -T /sysroot/etc /sysroot/usr/share/factory/etc

  - |
    cat >/sysroot/usr/lib/tmpfiles.d/extra-etc.conf<<EOF
    C /etc/bashrc
    C /etc/default
    C /etc/environment
    C /etc/hosts
    C /etc/issue
    C /etc/issue.net
    C /etc/ld.so.conf
    C /etc/locale.conf
    C /etc/localtime
    C /etc/login.defs
    C /etc/lvm
    C /etc/mke2fs.conf
    C /etc/pki
    C /etc/profile
    C /etc/profile.d
    C /etc/rpc
    C /etc/shells
    C /etc/skel
    C /etc/udev
    C /etc/xattr.conf
    C /etc/xdg
    C! /etc/audit
    C! /etc/pam.d
    C! /etc/security
    C! /etc/subgid
    C! /etc/subuid
    C! /etc/systemd/coredump.conf
    C! /etc/systemd/homed.conf
    C! /etc/systemd/journal-upload.conf
    C! /etc/systemd/journald.conf
    C! /etc/systemd/logind.conf
    C! /etc/systemd/networkd.conf
    C! /etc/systemd/oomd.conf
    C! /etc/systemd/pstore.conf
    C! /etc/systemd/resolved.conf
    C! /etc/systemd/sleep.conf
    C! /etc/systemd/system.conf
    C! /etc/systemd/timesyncd.conf
    C! /etc/systemd/user.conf
    EOF

  - |
    mksquashfs /sysroot/usr '%{install-root}/usr.squashfs'
