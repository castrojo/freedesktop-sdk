kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: cpan
  name: Module::ScanDeps
  url: cpan:authors/id/R/RS/RSCHUPP/Module-ScanDeps-1.33.tar.gz
  sha256sum: 55bde24e3b966ebe261e10bdc6720259d331e63a4d2fc086ce551987a5bbbb4c
