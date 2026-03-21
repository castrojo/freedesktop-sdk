kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/openssl.bst

sources:
- kind: cpan
  name: Net::SSLeay
  suffix: authors/id/C/CH/CHRISN/Net-SSLeay-1.96.tar.gz
  sha256sum: ab213691685fb2a576c669cbc8d9266f8165a31563ad15b7c4030b94adfc0753
