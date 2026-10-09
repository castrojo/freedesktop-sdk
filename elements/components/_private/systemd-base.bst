# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

# This element is not be used directly. Use either:
#  - components/systemd.bst
#  - components/systemd-libs.bst

(@):
- elements/include/systemd.yml

build-depends:
- public-stacks/runtime-minimal.bst
- public-stacks/buildsystem-meson.bst
- bootstrap/sed.bst
- bootstrap/gawk.bst
- bootstrap/grep.bst
- bootstrap/diffutils.bst
- components/audit.bst
- components/gperf.bst
- components/m4.bst
- components/libapparmor.bst
- components/libcap.bst
- components/libgcrypt.bst
- components/libgpg-error.bst
- components/libseccomp.bst
- components/lz4.bst
- components/zstd.bst
- components/util-linux-libfdisk.bst
- components/util-linux-libs.bst
# systemd services exist that call `agetty`, `fsck`, `mkswap` from util-linux-full.
- components/util-linux-full.bst
- components/libarchive.bst
- components/linux-pam.bst
- components/kmod.bst
- components/python3-pyelftools.bst
- components/libxslt.bst
- components/docbook-xsl.bst
- components/_private/cryptsetup-lvm2-stage1.bst
- components/p11-kit.bst
- components/libfido2.bst
- components/libidn2.bst
- components/openssl.bst
- components/python3-pefile.bst
- components/python3-jinja2.bst
- components/apparmor.bst
- components/tpm2-tss.bst
- components/curl.bst
- components/libqrencode.bst
- components/iptables.bst
- components/libxkbcommon.bst
- components/libmicrohttpd.bst
- components/bpf-maybe.bst
- components/libbpf.bst
- components/llvm.bst

variables:
  efi: 'false'
  bpf-framework: 'disabled'
  (?):
  - target_arch in ["x86_64", "i686", "aarch64", "riscv64", "loongarch64"]:
      efi: 'true'
  - target_arch in ["x86_64", "aarch64"]:
      bpf-framework: 'enabled'

  meson-local: >-
    -Dmode=release
    -Daudit=disabled
    -Dseccomp=disabled
    -Dsystem-uid-max=999
    -Dsystem-gid-max=999
    -Dusers-gid=100
    -Dopenssl=disabled
    -Dpam=enabled
    -Dbootloader=%{efi}
    -Defi=%{efi}
    -Dfirstboot=true
    -Dzlib=disabled
    -Dzstd=disabled
    -Dbzip2=disabled
    -Dxz=disabled
    -Dlz4=disabled
    -Ddefault-dnssec=no
    -Didn=false
    -Drepart=disabled
    -Dman=disabled
    -Dhtml=disabled
    -Dlibcryptsetup=disabled
    -Dlibcryptsetup-plugins=disabled
    -Dp11kit=disabled
    -Dlibfido2=disabled
    -Dapparmor=disabled
    -Dtpm=false
    -Dtpm2=disabled
    -Dsbat-distro=freedesktop-sdk
    -Dsbat-distro-generation=1
    -Dsbat-distro-summary="Freedesktop SDK"
    -Dsbat-distro-url=https://gitlab.com/freedesktop-sdk/freedesktop-sdk/
    -Dversion-tag="$(git describe --abbrev=7 | sed "s/^v//")"
    -Dqrencode=disabled
    -Dxkbcommon=disabled
    -Dlibidn2=disabled
    -Dxenctrl=disabled
    -Dbpf-framework=disabled
    -Dgnutls=disabled
    -Dglib=disabled
    -Ddbus=disabled
    -Dukify=%{efi}
    -Dkernel-install=false
    -Dvmlinux-h=provided
    -Dvmlinux-h-path='%{includedir}/%{gcc_triplet}/linux/vmlinux.h'
    -Dselinux=disabled
    -Dsysupdated=disabled
    -Dhomed=disabled
    -Duserdb=false
    -Dremote=disabled
    -Dnss-myhostname=false
    -Dnss-mymachines=disabled
    -Dnss-resolve=disabled
    -Dnss-systemd=false
    -Dresolve=false
    -Dhostnamed=false
    -Dlocaled=false
    -Dmachined=false
    -Dportabled=false
    -Dnetworkd=false
    -Dtimedated=false
    -Dtimesyncd=false
    -Dcoredump=false
    -Dpstore=false
    -Dlogind=false
    -Dhwdb=false
    -Drfkill=false
    -Dbacklight=false
    -Dquotacheck=false
    -Dhibernate=false
    -Dldconfig=false
    -Dsysext=false
    -Dvmspawn=disabled

config:
  install-commands:
    (>):
    - |
      shopt -s nullglob
      for name in %{install-root}%{indep-libdir}/systemd/boot/efi/*.elf.stub
      do
      chmod a-x ${name}
      done
      shopt -u nullglob

    - |
      install -Dm644 -t '%{install-root}%{indep-libdir}/systemd/system-preset' 90-sysupdate.preset

public:
  cpe:
    vendor: 'freedesktop'
    product: 'systemd'

  bst:
    split-rules:
      kernel-install:
      - '%{bindir}/kernel-install'
      - '%{datadir}/bash-completion/completions/kernel-install'
      - '%{datadir}/zsh/site-functions/_kernel-install'
      - '%{indep-libdir}/kernel'
      - '%{indep-libdir}/kernel/**'
      - '%{mandir}/man8/kernel-install.8'
      - '%{debugdir}%{bindir}/kernel-install.debug'
      ukify:
      - '%{bindir}/ukify'
      - '%{indep-libdir}/systemd/ukify'
      - '%{mandir}/man1/ukify.1'
      systemd-libs:
      - '%{libdir}'
      - '%{libdir}/libsystemd*.so*'
      - '%{libdir}/libudev*.so*'
      - '%{libdir}/libnss_resolve.so*'
      - '%{libdir}/pkgconfig'
      - '%{libdir}/pkgconfig/libsystemd.pc'
      - '%{libdir}/pkgconfig/libudev.pc'
      - '%{includedir}'
      - '%{includedir}/libudev.h'
      - '%{includedir}/systemd'
      - '%{includedir}/systemd/**'
      - '%{debugdir}/dwz/%{stripdir-suffix}/*'
      - '%{debugdir}%{libdir}/libsystemd*.so*'
      - '%{debugdir}%{libdir}/libudev*.so*'
      - '%{debugdir}%{libdir}/libnss_resolve.so*'
      - '%{sourcedir}'
      - '%{sourcedir}/**'
      systemd-license:
      - "%{project_licensedir}"
      - "%{project_licensedir}/**"

sources:
  (>):
  - kind: local
    path: files/systemd/90-sysupdate.preset
