kind: manual

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst
- components/perl-xml-parser.bst

variables:
  make-vars: >-
    PREFIX="%{prefix}"

config:
  build-commands:
  - |
    make %{make-vars}

  install-commands:
  - |
    make DESTDIR="%{install-root}" %{make-vars} install

sources:
- kind: tar
  url: sourceforge:projects/xmltoman/files/xmltoman/xmltoman-0.4.tar.gz/xmltoman-0.4.tar.gz
  ref: 948794a316aaecd13add60e17e476beae86644d066cb60171fc6b779f2df14b0
