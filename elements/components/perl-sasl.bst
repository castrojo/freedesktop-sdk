kind: makemaker

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/make.bst
- components/perl-module-install.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst

sources:
- kind: cpan
  name: Authen::SASL
  suffix: authors/id/E/EH/EHUELS/Authen-SASL-2.2000.tar.gz
  sha256sum: 8cdf5a7f185448b614471675dae5b26f8c6e330b62264c3ff5d91172d6889b99
