kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: git_repo
  url: github:Perl-Toolchain-Gang/Module-Build
  track: '*.*'
  exclude:
  - '0.*_*'
  ref: 0.4234-0-gbdf211f8cb3704cd470a98fcb35dca2c1472708e
