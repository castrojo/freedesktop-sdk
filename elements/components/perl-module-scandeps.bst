kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: cpan
  name: Module::ScanDeps
  url: cpan:authors/id/R/RS/RSCHUPP/Module-ScanDeps-1.31.tar.gz
  sha256sum: fc4d98d2b0015745f3b55b51ddf4445a73b069ad0cb7ec36d8ea781d61074d9d
