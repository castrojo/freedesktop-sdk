kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.099.tar.gz
  sha256sum: a0be800ff4852b1567ee5500e772417ad7a360abff80c01b5b875c15d44be832
