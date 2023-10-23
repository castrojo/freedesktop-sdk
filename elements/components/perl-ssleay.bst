kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/openssl.bst

sources:
- kind: cpan
  name: Net::SSLeay
  suffix: authors/id/C/CH/CHRISN/Net-SSLeay-1.92.tar.gz
  sha256sum: 47c2f2b300f2e7162d71d699f633dd6a35b0625a00cbda8c50ac01144a9396a9
