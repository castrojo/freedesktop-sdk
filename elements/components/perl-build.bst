kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: git_repo
  url: github:Perl-Toolchain-Gang/Module-Build
  track: 0.*
  ref: 0.4232-0-g0a3ed90724d09007a91d67118005805ecebdba38
