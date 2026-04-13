# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  systemd service manager.

  Use systemd-libs.bst if you only need the systemd libraries.

  This element requires some utility programs at runtime, including: `agetty`,
  `fsck` and `mkswap`. Multiple implementations of these are available and
  system integrators must choose one and include it in their system. FDSDK
  provides the util-linux implementations in `components/util-linux-full.bst`.

build-depends:
- components/_private/systemd-base.bst

runtime-depends:
- bootstrap/libxcrypt.bst
- bootstrap/xz.bst
- components/systemd-libs.bst
- components/audit.bst
- components/libapparmor.bst
- components/libgpg-error.bst
- components/linux-pam.bst
- components/kmod.bst
- components/systemd-manifest.bst
- components/tzdata.bst
- components/shadow.bst
- components/util-linux-libfdisk.bst
- components/util-linux-libs.bst
# systemd services exist that call `agetty`, `fsck`, `mkswap` from util-linux-full.
- components/util-linux-full.bst
- components/libidn2.bst
- components/libseccomp.bst
- components/kbd.bst
- components/cryptsetup.bst
- components/p11-kit.bst
- components/openssl.bst
- components/libapparmor.bst
- components/curl.bst
- components/libmicrohttpd.bst
- components/libbpf.bst

(?):
- target_arch != "ppc64le":
    runtime-depends:
      (>):
      - components/systemd-hwdb-maybe.bst

config:
  exclude:
  - systemd-libs
  - ukify
  - kernel-install

  include-orphans: True

public:
  bst:
    split-rules:
      runtime:
        (>):
        - '%{bindir}/resolvectl'
        - '%{bindir}/updatectl'
        - '%{indep-libdir}/environment.d/**'
        - '%{indep-libdir}/kernel/**'
        - '%{indep-libdir}/modprobe.d/**'
        - '%{indep-libdir}/sysctl.d/**'
        - '%{indep-libdir}/systemd/**'
        - '%{indep-libdir}/sysusers.d/**'
        - '%{indep-libdir}/tmpfiles.d/**'
        - '%{indep-libdir}/udev/**'
        - '%{datadir}/bash-completion/**'
        - '%{datadir}/dbus-1/**'
        - '%{datadir}/factory/**'
        - '%{datadir}/polkit-1/**'
        - '%{datadir}/systemd/**'
        - '%{datadir}/zsh/**'
        - '%{sysconfdir}/**'
        - '%{localstatedir}/**'
      devel:
        (>):
        - '%{indep-libdir}/udev/hwdb.d/**'
    overlap-whitelist:
    - "%{project_licensedir}/systemd"
    - "%{project_licensedir}/systemd/**"
