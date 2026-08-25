# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/runtime-gnu.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libxml2.bst

runtime-depends:
- components/clean-xml-catalog.bst
- components/docbook5-xml.bst

variables:
  data: '%{datadir}/xml/docbook/xml/xsl-stylesheets-ns'
  strip-binaries: ''

config:
  install-commands:
  - |
    set -e

    install -v -m755 -d "%{install-root}%{data}"

    cp -v -R VERSION VERSION.xsl assembly common eclipse epub epub3 fo highlighting \
             html htmlhelp images javahelp lib manpages params profiling          \
             roundtrip slides template tests webhelp website xhtml*              \
        "%{install-root}%{data}"

    install -v -m644 -D README "%{install-root}%{data}/README.txt"
    install -v -m644 RELEASE-NOTES* NEWS* "%{install-root}%{data}"

  - |
    %{install-extra}

public:
  bst:
    integration-commands:
    - |
      set -e

      mkdir -p "%{sysconfdir}/xml"
      [ -f "%{sysconfdir}/xml/catalog" ] || xmlcatalog --noout --create "%{sysconfdir}/xml/catalog"

      add_main() {
        xmlcatalog --noout --add "$1" "$2" "file://%{data}" "%{sysconfdir}/xml/catalog"
      }

      for uri in \
        "http://cdn.docbook.org/release/xsl/1.79.2" \
        "https://cdn.docbook.org/release/xsl/1.79.2" \
        "http://cdn.docbook.org/release/xsl/current" \
        "https://cdn.docbook.org/release/xsl/current" \
        "http://docbook.sourceforge.net/release/xsl-ns/1.79.2" \
        "http://docbook.sourceforge.net/release/xsl-ns/current"; do
        add_main rewriteSystem "$uri"
        add_main rewriteURI "$uri"
      done

sources:
- kind: zip
  url: github_files:docbook/xslt10-stylesheets/releases/download/release/1.79.2/docbook-xsl-1.79.2.zip
  ref: 853dce096f5b32fe0b157d8018d8fecf92022e9c79b5947a98b365679c7e31d7
  base-dir: docbook-xsl-1.79.2
