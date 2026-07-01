# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/base-sdk.yml

build-depends:
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/m4.bst
- bootstrap/base-sdk/perl.bst

variables:
  conf-local: >-
    --program-suffix=2.69

  make-args: pkgdatadir='%{datadir}/autoconf2.69'

config:
  configure-commands:
    (<):
    - |
      cp %{datadir}/gnu-config/config.guess %{datadir}/gnu-config/config.sub build-aux/

  install-commands:
    (>):
    - |
      mv '%{install-root}%{infodir}/autoconf.info' '%{install-root}%{infodir}/autoconf2.69.info'
      mv '%{install-root}%{infodir}/standards.info' '%{install-root}%{infodir}/standards2.69.info'

sources:
- kind: tar
  url: ftp_gnu_org:autoconf/autoconf-2.69.tar.xz
  ref: 64ebcec9f8ac5b2487125a86a7760d2591ac9e1d3dbd59489633f9de62a57684
