kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
build-depends:
- components/perl-module-install.bst

sources:
- kind: cpan
  name: Authen::SASL
  url: cpan:authors/id/G/GB/GBARR/Authen-SASL-2.16.tar.gz
  sha256sum: 6614fa7518f094f853741b63c73f3627168c5d3aca89b1d02b1016dc32854e09
