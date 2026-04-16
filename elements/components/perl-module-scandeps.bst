kind: makemaker

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/make.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst

sources:
- kind: cpan
  name: Module::ScanDeps
  suffix: authors/id/R/RS/RSCHUPP/Module-ScanDeps-1.37.tar.gz
  sha256sum: 1f5e119cade1466c39c71e5bc35a8d4f4e672635db03d79a5a0dcf08c4e2b5a3
