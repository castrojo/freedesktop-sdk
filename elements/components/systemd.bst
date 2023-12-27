kind: filter

build-depends:
- components/systemd-base.bst

runtime-depends:
- components/systemd-libs.bst
- components/systemd-hwdb.bst
- components/audit.bst
- components/libapparmor.bst
- components/libgpg-error.bst
- components/linux-pam.bst
- components/kmod.bst
- components/systemd-manifest.bst
- components/tzdata.bst
- components/shadow.bst
- components/util-linux-full.bst
- components/libidn2.bst
- components/libseccomp.bst
- components/kbd.bst
- components/cryptsetup.bst
- components/p11-kit.bst
- components/libfido2.bst
- components/openssl.bst
- components/libapparmor.bst
- components/tpm2-tss.bst
- components/curl.bst
- components/libqrencode.bst
- components/iptables.bst
- components/libxkbcommon.bst
- components/libmicrohttpd.bst

config:
  exclude:
  - systemd-libs

  include-orphans: True

public:
  bst:
    split-rules:
      runtime:
        (>):
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
