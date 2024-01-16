kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/openssl.bst

sources:
- kind: cpan
  name: Net::SSLeay
  suffix: authors/id/C/CH/CHRISN/Net-SSLeay-1.94.tar.gz
  sha256sum: 9d7be8a56d1bedda05c425306cc504ba134307e0c09bda4a788c98744ebcd95d
