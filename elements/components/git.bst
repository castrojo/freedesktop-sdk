kind: meson

(@):
- elements/include/git.yml

build-depends:
- components/asciidoc.bst
- components/_private/buildsystem-meson.bst
- components/docbook-xsl.bst
- components/grep.bst
- components/libxslt.bst
- components/rust.bst
- components/sed.bst
- components/tar.bst
- components/xmlto.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst
- components/python3.bst
- components/gnupg.bst
- components/curl.bst
- components/expat.bst
- components/libffi.bst
- components/openssl.bst
- components/zstd.bst

runtime-depends:
- bootstrap/zlib-ng.bst
- components/ca-certificates.bst
- components/perl-ssl.bst
- components/perl-sasl.bst


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
