kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/docbook-xsl.bst
- components/gperf.bst
- components/libxslt.bst
- components/m4.bst
- components/python3-jinja2.bst

depends:
- bootstrap-import.bst
- components/kmod.bst
- components/libcap.bst
- components/libgpg-error.bst
- components/lz4.bst
- components/linux-pam.bst
- components/openssl.bst
- components/util-linux-full.bst

variables:
  meson-local: >-
    -Dauto_features=disabled
    -Drootprefix=%{prefix}
    -Drootlibdir=%{libdir}
    -Dsysvinit-path=%{sysconfdir}/init.d
    -Daudit=false
    -Dseccomp=false
    -Dsystem-uid-max=999
    -Dsystem-gid-max=999
    -Dusers-gid=100
    -Dopenssl=enabled
    -Dpam=enabled
    -Dbootloader=false
    -Defi=false
    -Dfirstboot=true
    -Dzlib=enabled
    -Dbzip2=enabled
    -Dxz=enabled
    -Dlz4=enabled
    -Ddefault-dnssec=no
    -Drepart=disabled
    -Dman=disabled
    -Dhtml=disabled
    -Dlibcryptsetup=disabled
    -Dlibcryptsetup-plugins=disabled
    -Dp11kit=disabled
    -Dlibfido2=disabled
    -Dbpf-framework=disabled
    -Dapparmor=disabled
    -Dxenctrl=disabled
    -Dmicrohttpd=disabled

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
