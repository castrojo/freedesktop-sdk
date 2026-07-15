# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

depends:
- public-stacks/runtime-minimal.bst
- components/libxml2.bst

runtime-depends:
- components/clean-xml-catalog.bst
- components/docbook-xml.bst

variables:
  data: '%{datadir}/xml/docbook/xml/xsl-stylesheets'
  strip-binaries: ''

config:
  install-commands:
  - |
    set -e

    install -v -m755 -d "%{install-root}%{data}"

    cp -v -R VERSION assembly common eclipse epub epub3 fo highlighting  \
             html htmlhelp images javahelp lib manpages params profiling \
             roundtrip slides template tests webhelp website xhtml*      \
        "%{install-root}%{data}"

    ln -s VERSION "%{install-root}%{data}/VERSION.xsl"

    install -v -m644 -D README "%{install-root}%{data}/README.txt"
    install -v -m644 RELEASE-NOTES* NEWS* "%{install-root}%{data}"

  - |
    %{install-extra}

public:
  bst:
    integration-commands:
    - |
      set -e

      [ -f "%{sysconfdir}/xml/catalog" ] || xmlcatalog --noout --create "%{sysconfdir}/xml/catalog"
      add_main() {
        xmlcatalog --noout --add "$1" "$2" "file://%{data}" "%{sysconfdir}/xml/catalog"
      }

      add_main rewriteSystem "http://docbook.sourceforge.net/release/xsl/1.79.2"
      add_main rewriteURI "http://docbook.souceforge.net/release/xsl/1.79.2"
      add_main rewriteSystem "http://docbook.sourceforge.net/release/xsl/current"
      add_main rewriteURI "http://docbook.sourceforge.net/release/xsl/current"

sources:
- kind: tar
  url: github_files:docbook/xslt10-stylesheets/releases/download/release/1.79.2/docbook-xsl-nons-1.79.2.tar.gz
  ref: f89425b44e48aad24319a2f0d38e0cb6059fdc7dbaf31787c8346c748175ca8e
- kind: patch
  strip-level: '2'
  path: patches/docbook-xsl/docbook-xsl-non-recursive_string_subst.patch
- kind: patch
  strip-level: '2'
  path: patches/docbook-xsl/consistent-identifiers.patch
