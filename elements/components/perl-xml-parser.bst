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
  suffix: authors/id/T/TO/TODDR/XML-Parser-2.53.tar.gz
  sha256sum: 991506b14600ae5b6188319509d36e7451d840f34c24cf507d1dc4392cb08487
