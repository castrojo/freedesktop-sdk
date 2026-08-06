kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gnutls.bst

variables:
  conf-local: >-
    --disable-examples
    --disable-tools
    --enable-https
    --with-gnutls
    --enable-largefile

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"
      rm -vf "%{install-root}%{infodir}"/*.png

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmicrohttpd.so'
  cpe:
    ignored:
    - CVE-2025-62689   # Consumed after v1.0.3
    - CVE-2025-59777   # Consumed after v1.0.3

sources:
- kind: git_repo
  url: fdsdk_mirror:git_gnunet_org/libmicrohttpd.git
  ref: v1.0.2-0-gf2e3bbda41c6263527808187c45f90b1704332f9
