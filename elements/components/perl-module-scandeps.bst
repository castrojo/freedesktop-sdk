kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: cpan
  name: Module::ScanDeps
  suffix: authors/id/R/RS/RSCHUPP/Module-ScanDeps-1.35.tar.gz
  sha256sum: e5beb3adf55be3dab71f9a1416d4bad57b14e5e05c96370741b9d8f96a51b612
