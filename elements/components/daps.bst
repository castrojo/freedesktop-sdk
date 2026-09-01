# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/docbook-xml.bst
- components/docbook-xsl.bst
- components/docbook5-xml.bst
- components/docbook5-xsl.bst
- components/gawk.bst
- components/grep.bst
- components/imagemagick.bst
- components/jing.bst
- components/libxml2.bst
- components/libxslt.bst
- components/make.bst
- components/poppler.bst
- components/python3-lxml.bst
- components/util-linux.bst
- components/xmlstarlet.bst
- components/zip.bst

environment:
  XML_CATALOG_FILES: '/tmp/daps-catalog.xml /etc/xml/catalog'

variables:
  build-dir: ''
  notparallel: True
  conf-local: >-
    --disable-edit-rootcatalog

config:
  configure-commands:
    (<):
    - |
      set -e

      xmlcatalog --noout --create /tmp/daps-catalog.xml

      xmlcatalog --noout \
        --add rewriteSystem \
        "http://www.w3.org/2003/entities/iso8879/" \
        "file://%{datadir}/xml/docbook/xml-dtd/ent/" \
        /tmp/daps-catalog.xml

public:
  bst:
    integration-commands:
    - |
      set -e

      mkdir -p "%{sysconfdir}/xml"
      [ -f "%{sysconfdir}/xml/catalog" ] || xmlcatalog --noout --create "%{sysconfdir}/xml/catalog"

      xmlcatalog --noout \
        --add rewriteSystem \
        "http://www.w3.org/2003/entities/iso8879/" \
        "file://%{datadir}/xml/docbook/xml-dtd/ent/" \
        "%{sysconfdir}/xml/catalog"

sources:
- kind: git_repo
  url: github:openSUSE/daps.git
  track: '*.*.*'
  ref-format: git-describe
  ref: 3.3.2-0-g30e43ef03fa145fc151cc124290c6fa733ee8252
