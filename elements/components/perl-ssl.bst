kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.094.tar.gz
  sha256sum: b2446889cb5e20545d782c4676da1b235673a81c181689aaae2492589d84bf02
