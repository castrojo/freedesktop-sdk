kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: git_tag
  url: github:Perl-Toolchain-Gang/Module-Build
  track: master
  ref: 0.4232-0-g0a3ed90724d09007a91d67118005805ecebdba38
