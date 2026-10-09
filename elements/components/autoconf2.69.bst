# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

# Note that public-stacks/runtime-minimal.bst build-depends on this element
# via gcc-libs.bst -> _private/gcc-base.bst. So we have to use bootstrap/
# elements in build-depends, and we cannot use
# public-stacks/runtime-minimal.bst in runtime-depends.

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gcc.bst
- bootstrap/make.bst
- bootstrap/stripper.bst
- bootstrap/gawk.bst
#- public-stacks/runtime-minimal.bst
- bootstrap/grep.bst
- bootstrap/sed.bst
- bootstrap/symlinks.bst
- components/m4.bst
- components/perl.bst
- components/utf-locale.bst

runtime-depends:
- components/gawk.bst
#- public-stacks/runtime-minimal.bst
- components/grep.bst
- components/sed.bst
- components/symlinks.bst
- components/m4.bst
- components/perl.bst
- components/utf-locale.bst
- components/gettext.bst

variables:
  conf-local: >-
    --program-suffix=2.69

  make-args: pkgdatadir='%{datadir}/autoconf2.69'

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
