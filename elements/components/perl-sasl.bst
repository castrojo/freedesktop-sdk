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
  suffix: authors/id/E/EH/EHUELS/Authen-SASL-2.1700.tar.gz
  sha256sum: b86d5a576b8d387aee24f39f47a54afd14bb66b09003db5065001f1de03a8ece
