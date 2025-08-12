kind: makemaker

build-depends:
- bootstrap/make.bst
- components/perl-module-install.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst

sources:
- kind: cpan
  name: Authen::SASL
  suffix: authors/id/E/EH/EHUELS/Authen-SASL-2.1900.tar.gz
  sha256sum: be3533a6891b2e677150b479c1a0d4bf11c8bbeebed3e7b8eba34053e93923b0
