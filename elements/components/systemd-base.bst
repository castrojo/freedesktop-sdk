kind: meson

# This element is not be used directly. Use either:
#  - components/systemd.bst
#  - components/systemd-libs.bst

build-depends:
- bootstrap-import.bst
- public-stacks/buildsystem-meson.bst
- components/gperf.bst
- components/m4.bst
- components/libcap.bst
- components/libgcrypt.bst
- components/libgpg-error.bst
- components/lz4.bst
- components/util-linux.bst
- components/linux-pam.bst
- components/kmod.bst
- components/gnu-efi-maybe.bst
- components/libxslt.bst
- components/docbook-xsl.bst
- components/cryptsetup-lvm2-stage1.bst
- components/p11-kit.bst
- components/libfido2.bst
- components/openssl.bst
- components/python3-jinja2.bst
- components/apparmor.bst

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

variables:
  efi: 'false'
  (?):
  - target_arch in ["x86_64", "i686", "arm", "aarch64", "riscv64"]:
      efi: 'true'
  meson-local: >-
    -Drootprefix=%{prefix}
    -Drootlibdir=%{libdir}
    -Dsysvinit-path=%{sysconfdir}/init.d
    -Daudit=false
    -Dseccomp=false
    -Dsystem-uid-max=999
    -Dsystem-gid-max=999
    -Dusers-gid=100
    -Dopenssl=true
    -Dpam=true
    -Dgnu-efi=%{efi}
    -Defi=%{efi}
    -Dfirstboot=true
    -Dzlib=true
    -Dbzip2=true
    -Dxz=true
    -Dlz4=true
    -Ddefault-dnssec=no
    -Drepart=true
    -Dman=true
    -Dhtml=true
    -Dlibcryptsetup=true
    -Dp11kit=true
    -Dlibfido2=true
    -Dapparmor=true

public:
  cpe:
    vendor: 'freedesktop'
    product: 'systemd'
    version-match: '\d+'

  bst:
    split-rules:
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
      - '%{sourcedir}'
      - '%{sourcedir}/**'

(@):
- elements/include/systemd.yml
