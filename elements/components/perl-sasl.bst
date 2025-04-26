kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
build-depends:
- components/perl-module-install.bst

sources:
- kind: cpan
  name: Authen::SASL
  suffix: authors/id/E/EH/EHUELS/Authen-SASL-2.1800.tar.gz
  sha256sum: 0b03686bddbbf7d5c6548e468d079a4051c9b73851df740ae28cfd2db234e922
