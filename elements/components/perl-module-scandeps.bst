kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: cpan
  name: Module::ScanDeps
  suffix: authors/id/R/RS/RSCHUPP/Module-ScanDeps-1.34.tar.gz
  sha256sum: cac530e5cfc413e067797c7d237c6c5cd32915c3d9faee5d94035c8f3a8550eb
