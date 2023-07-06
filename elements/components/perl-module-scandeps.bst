kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: cpan
  name: Module::ScanDeps
  url: cpan:authors/id/R/RS/RSCHUPP/Module-ScanDeps-1.32.tar.gz
  sha256sum: 7ab3556ccaa812298da33f0a0515037cd513b9e72c42a76d2c2e4d28832215f0
