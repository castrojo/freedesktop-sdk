kind: autotools

build-depends:
- bootstrap/bootstrap.bst

depends:
- bootstrap/bootstrap-base.bst
- components/m4.bst
- components/perl.bst

variables:
  conf-local: >-
    --program-suffix=2.69

  make: make pkgdatadir='%{datadir}/autoconf2.69'
  make-install: make -j1 install DESTDIR='%{install-root}' pkgdatadir='%{datadir}/autoconf2.69'

config:
  install-commands:
    (>):
    - |
      mv '%{install-root}%{infodir}/autoconf.info' '%{install-root}%{infodir}/autoconf2.69.info'
      mv '%{install-root}%{infodir}/standards.info' '%{install-root}%{infodir}/standards2.69.info'

sources:
- kind: tar
  url: ftp_gnu_org:autoconf/autoconf-2.69.tar.xz
  ref: 64ebcec9f8ac5b2487125a86a7760d2591ac9e1d3dbd59489633f9de62a57684
