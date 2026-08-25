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
  data: '%{datadir}/xml/docbook/schema/5.2'
  strip-binaries: ''

config:
  install-commands:
  - |
    set -e

    install -d "%{install-root}%{data}"
    cp -R rng sch "%{install-root}%{data}"

    install -m 644 catalog.xml \
      docbook.nvdl dbits.nvdl assembly.nvdl \
      "%{install-root}%{data}"

  - |
    %{install-extra}

public:
  bst:
    integration-commands:
    - |
      set -e

      mkdir -p "%{sysconfdir}/xml"
      [ -f "%{sysconfdir}/xml/catalog" ] || xmlcatalog --noout --create "%{sysconfdir}/xml/catalog"

      xmlcatalog --noout \
        --add nextCatalog "" "file://%{data}/catalog.xml" \
        "%{sysconfdir}/xml/catalog"

sources:
- kind: zip
  url: tar_https:docs.oasis-open.org/docbook/docbook/v5.2/os/docbook-v5.2-os.zip
  ref: 82b31bfba1c4a35f138995abd4e7e4a3dc9fe17217def9527979bf42c1698962
  base-dir: ''
