kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gzip.bst
- components/openssl.bst
- components/systemd.bst

variables:
  # Makefiles not added to build-dir which makes it unusable
  build-dir: ''
  conf-local: >-
    --enable-debug
    --with-components=all
    --with-dbusdir=/etc/dbus-1
    --with-tls=openssl
    --with-cups-group=lp
    --with-pkgconfpath="%{libdir}/pkgconfig"
    --with-system-groups=wheel
    --with-rundir=/run/cups
    localedir=/usr/share/locale
    DSOFLAGS="$CFLAGS $LDFLAGS"

config:
  install-commands:
  - |
    make -j1 DSTROOT="%{install-root}" install

  - |
    tmpfilesdir="$(pkg-config --variable tmpfilesdir systemd)"
    install -Dm644 tmpfiles.conf "%{install-root}${tmpfilesdir}/cups.conf"

  - |
    sysusersdir="$(pkg-config --variable sysusersdir systemd)"
    install -Dm644 sysusers.conf "%{install-root}${sysusersdir}/cups.conf"

public:
  bst:
    split-rules:
      cups-libs:
      - '%{datadir}/locale'
      - '%{datadir}/locale/**'
      - '%{includedir}'
      - '%{includedir}/**'
      - '%{bindir}/cups-config'
      - "%{libdir}/pkgconfig/cups.pc"
      - '%{libdir}/lib*.so'
      - '%{libdir}/lib*.so.*'
      - '%{debugdir}%{libdir}/lib*.so.*'
      - '%{debugdir}/dwz'
      - '%{debugdir}/dwz/**'
      - '%{sourcedir}'
      - '%{sourcedir}/**'

  cpe:
    product: cups

sources:
- kind: git_repo
  url: github:OpenPrinting/cups.git
  track: v*
  exclude:
  - "*a*"
  - "*b*"
  ref: v2.4.7-0-g3a4d9204e5818e5d0b8f1e0e50832661209048ee
- kind: local
  path: files/cups/tmpfiles.conf
- kind: local
  path: files/cups/sysusers.conf
