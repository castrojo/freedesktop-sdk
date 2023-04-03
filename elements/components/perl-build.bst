kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: git_tag
  url: github:Perl-Toolchain-Gang/Module-Build
  track: master
  ref: 0.42_33-0-g22a4c30f92099f2a5a5d17d4e3d8195b5c081cb5
