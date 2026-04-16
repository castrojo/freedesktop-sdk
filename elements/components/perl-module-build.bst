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
  name: Module::Build
  suffix: authors/id/L/LE/LEONT/Module-Build-0.4234.tar.gz
  sha256sum: 66aeac6127418be5e471ead3744648c766bd01482825c5b66652675f2bc86a8f
