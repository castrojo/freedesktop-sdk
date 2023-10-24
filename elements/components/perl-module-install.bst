kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-module-build.bst
- components/perl-module-scandeps.bst
- components/perl-yaml-tiny.bst

sources:
- kind: cpan
  name: Module::Install
  suffix: authors/id/E/ET/ETHER/Module-Install-1.21.tar.gz
  sha256sum: fbf91007f30565f3920e106055fd0d4287981d5e7dad8b35323ce4b733f15a7b
