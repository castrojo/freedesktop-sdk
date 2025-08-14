kind: manual

build-depends:
- bootstrap/sed.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libxml2.bst

runtime-depends:
- components/clean-xml-catalog.bst

variables:
  data: '%{datadir}/xml/docbook/xml-dtd'
  strip-binaries: ''

config:
  build-commands:
  - |
    set -e

    xmlcatalog --noout --create docbook

    add() {
      xmlcatalog --noout --add "$1" "$2" "file://%{data}/$3" docbook
    }

    add system "http://docbook.org/xml/4.5/docbookx.dtd" 4.5/docbookx.dtd

    for version in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
      add public "-//OASIS//DTD DocBook XML V${version}//EN" ${version}/docbookx.dtd
      add system "http://www.oasis-open.org/docbook/xml/${version}/docbookx.dtd" ${version}/docbookx.dtd
      add public "-//OASIS//DTD DocBook CALS Table Model V${version}//EN" ${version}/calstblx.dtd
      add public "-//OASIS//ELEMENTS DocBook XML HTML Tables V${version}//EN" ${version}/htmltblx.mod
      add public "//OASIS//DTD XML Exchange Table Model 19990315//EN" ${version}/soextblx.dtd
      add public "-//OASIS//ELEMENTS DocBook Information Pool V${version}//EN" ${version}/dbpoolx.mod
      add public "-//OASIS//ELEMENTS DocBook Document Hierarchy V${version}//EN" ${version}/dbhierx.mod
      add public "-//OASIS//ENTITIES DocBook Additional General Entities V${version}//EN" ${version}/dbgenent.mod
      add public "-//OASIS//ENTITIES DocBook Notations V${version}//EN" ${version}/dbnotnx.mod
      add public "-//OASIS//ENTITIES DocBook Character Entities V${version}//EN" ${version}/dbcentx.mod

      # Fix paths to .ent files.
      sed -ri 's,"ent/iso-?,"%{data}/ent/iso,' ${version}/dbcentx.mod
    done

    add public "ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML" ent/isodia.ent
    add public "ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML" ent/isonum.ent
    add public "ISO 8879:1986//ENTITIES Publishing//EN//XML" ent/isopub.ent
    add public "ISO 8879:1986//ENTITIES General Technical//EN//XML" ent/isotech.ent
    add public "ISO 8879:1986//ENTITIES Added Latin 1//EN//XML" ent/isolat1.ent
    add public "ISO 8879:1986//ENTITIES Added Latin 2//EN//XML" ent/isolat2.ent
    add public "ISO 8879:1986//ENTITIES Greek Letters//EN//XML" ent/isogrk1.ent
    add public "ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML" ent/isogrk2.ent
    add public "ISO 8879:1986//ENTITIES Greek Symbols//EN//XML" ent/isogrk3.ent
    add public "ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML" ent/isogrk4.ent
    add public "ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML" ent/isoamsa.ent
    add public "ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML" ent/isoamsb.ent
    add public "ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML" ent/isoamsc.ent
    add public "ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML" ent/isoamsn.ent
    add public "ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML" ent/isoamso.ent
    add public "ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML" ent/isoamsr.ent
    add public "ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML" ent/isobox.ent
    add public "ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML" ent/isocyr1.ent
    add public "ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML" ent/isocyr2.ent

  install-commands:
  - |
    set -e
    for version in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
      install -D -m 644  -t "%{install-root}%{data}/${version}" ${version}/*.dtd ${version}/*.mod
    done
    install -D -m 644 -t "%{install-root}%{data}/ent" 4.5/ent/*.ent
    install -D -m 644 docbook "%{install-root}%{sysconfdir}/xml/docbook"

  - |
    %{install-extra}

public:
  bst:
    integration-commands:
    - |
      set -e

      [ -f "%{sysconfdir}/xml/catalog" ] || xmlcatalog --noout --create "%{sysconfdir}/xml/catalog"
      add_main() {
        xmlcatalog --noout --add "$1" "$2" "file://%{sysconfdir}/xml/docbook" "%{sysconfdir}/xml/catalog"
      }

      add_main delegatePublic "-//OASIS//ENTITIES DocBook XML"
      add_main delegatePublic "-//OASIS//DTD DocBook XML"
      add_main delegateSystem "http://www.oasis-open.org/docbook/"
      add_main delegateSystem "http://docbook.org/xml/"

sources:
- kind: zip
  url: tar_https:docbook.org/xml/4.5/docbook-xml-4.5.zip
  ref: 4e4e037a2b83c98c6c94818390d4bdd3f6e10f6ec62dd79188594e26190dc7b4
  base-dir: ''
  directory: 4.5
- kind: zip
  url: oasis_open_xml:4.4/docbook-xml-4.4.zip
  ref: 02f159eb88c4254d95e831c51c144b1863b216d909b5ff45743a1ce6f5273090
  base-dir: ''
  directory: 4.4
- kind: zip
  url: oasis_open_xml:4.3/docbook-xml-4.3.zip
  ref: 23068a94ea6fd484b004c5a73ec36a66aa47ea8f0d6b62cc1695931f5c143464
  base-dir: ''
  directory: 4.3
- kind: zip
  url: oasis_open_xml:4.2/docbook-xml-4.2.zip
  ref: acc4601e4f97a196076b7e64b368d9248b07c7abf26b34a02cca40eeebe60fa2
  base-dir: ''
  directory: 4.2
- kind: zip
  url: oasis_open_xml:4.1.2/docbkx412.zip
  ref: 30f0644064e0ea71751438251940b1431f46acada814a062870f486c772e7772
  base-dir: ''
  directory: 4.1.2
- kind: zip
  url: oasis_open_xml:4.0/docbkx40.zip
  ref: 8edb0630fcb659f2547534ef3856a7e30de7cd0afe2405fa7abdebb83affca90
  base-dir: ''
  directory: 4.0
