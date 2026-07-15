# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/include/git.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/asciidoc.bst
- components/docbook-xsl.bst
- components/grep.bst
- components/libxslt.bst
- components/rust.bst
- components/sed.bst
- components/tar.bst
- components/xmlto.bst

depends:
- public-stacks/runtime-minimal.bst
- components/curl.bst
- components/expat.bst
- components/gnupg.bst
- components/libffi.bst
- components/openssl.bst
- components/perl.bst
- components/python3.bst
- components/zstd.bst

runtime-depends:
- bootstrap/zlib-ng.bst
- components/ca-certificates.bst
- components/perl-sasl.bst
- components/perl-ssl.bst

variables:
  meson-local: >-
    -Dtests=false
    -Dcoccinelle=disabled
    -Dbenchmarks=disabled
    -Dgitk=disabled
    -Dgit_gui=disabled
    -Ddocs=man

public:
  bst:
    overlap-whitelist:
    - "%{bindir}/git"
    - "%{debugdir}%{bindir}/git.debug"
    - "%{project_licensedir}/git"
    - "%{project_licensedir}/git/**"
  cpe:
    vendor: git-scm
