kind: makemaker

(@):
- include/strip.yml

build-depends:
- public-stacks/buildsystem-make.bst
- components/perl-file-sharedir-install.bst

depends:
- public-stacks/runtime-minimal.bst
- components/expat.bst
- components/perl.bst
- components/perl-file-sharedir.bst

sources:
- kind: cpan
  name: XML::Parser
  suffix: authors/id/T/TO/TODDR/XML-Parser-2.55.tar.gz
  sha256sum: 7d2dd51a0c3f3441339dba2af3987052795adb532a8e05d967198c62dfb7db2f
