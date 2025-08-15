kind: meson

(@):
- elements/include/git.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/asciidoc.bst
- components/docbook-xsl.bst
- components/grep.bst
- components/libxslt.bst
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
- bootstrap/zlib.bst
- components/ca-certificates.bst
- components/perl-ssl.bst
- components/perl-sasl.bst


variables:
  meson-local: >-
    -Dtests=false
    -Dcoccinelle=disabled
    -Dbenchmarks=disabled
    -Ddocs=man

public:
  bst:
    overlap-whitelist:
    - "%{bindir}/git"
    - "%{debugdir}%{bindir}/git.debug"
  cpe:
    vendor: git-scm
