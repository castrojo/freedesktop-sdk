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

variables:
  data: '%{datadir}/xml/docbook/schema'
  strip-binaries: ''

config:
  install-commands:
  - |
    set -e

    install -d "%{install-root}%{data}/5.0"
    cp -R 5.0/docbook-5.0/dtd 5.0/docbook-5.0/rng \
      5.0/docbook-5.0/sch 5.0/docbook-5.0/xsd \
      "%{install-root}%{data}/5.0"

    install -m 644 \
      5.0/docbook-5.0/catalog.xml \
      5.0/docbook-5.0/docbook.nvdl \
      "%{install-root}%{data}/5.0"

    install -d "%{install-root}%{data}/5.1"
    cp -R 5.1/schemas/rng 5.1/schemas/sch \
      "%{install-root}%{data}/5.1"
    install -m 644 5.1/schemas/catalog.xml 5.1/schemas/docbook.nvdl \
      "%{install-root}%{data}/5.1"

    install -d "%{install-root}%{data}/5.2"
    cp -R 5.2/rng 5.2/sch \
      "%{install-root}%{data}/5.2"
    install -m 644 \
      5.2/catalog.xml \
      5.2/docbook.nvdl \
      5.2/dbits.nvdl \
      5.2/assembly.nvdl \
      "%{install-root}%{data}/5.2"

  - |
    %{install-extra}

public:
  bst:
    integration-commands:
    - |
      set -e

      mkdir -p "%{sysconfdir}/xml"
      [ -f "%{sysconfdir}/xml/catalog" ] || xmlcatalog --noout --create "%{sysconfdir}/xml/catalog"

      for version in 5.0 5.1 5.2; do
        xmlcatalog --noout \
          --add nextCatalog "" "file://%{data}/${version}/catalog.xml" \
          "%{sysconfdir}/xml/catalog"
      done

      xmlcatalog --noout \
        --add rewriteSystem \
        "http://docbook.org/xml/5.1/" \
        "file://%{data}/5.1/" \
        "%{sysconfdir}/xml/catalog"

      xmlcatalog --noout \
        --add rewriteURI \
        "http://docbook.org/xml/5.1/" \
        "file://%{data}/5.1/" \
        "%{sysconfdir}/xml/catalog"

sources:
- kind: zip
  url: tar_https:docs.oasis-open.org/docbook/xml/5.0/docbook-5.0.zip
  ref: 3dcd65e1f5d9c0c891b3be204fa2bb418ce485d32310e1ca052e81d36623208e
  base-dir: ''
  directory: '5.0'

- kind: zip
  url: tar_https:docs.oasis-open.org/docbook/docbook/v5.1/os/docbook-v5.1-os.zip
  ref: b3f3413654003c1e773360d7fc60ebb8abd0e8c9af8e7d6c4b55f124f34d1e7f
  base-dir: ''
  directory: '5.1'

- kind: zip
  url: tar_https:docs.oasis-open.org/docbook/docbook/v5.2/os/docbook-v5.2-os.zip
  ref: 82b31bfba1c4a35f138995abd4e7e4a3dc9fe17217def9527979bf42c1698962
  base-dir: ''
  directory: '5.2'
