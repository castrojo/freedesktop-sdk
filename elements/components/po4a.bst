kind: modulebuild

build-depends:
- components/perl-build.bst
- components/gettext.bst
- components/libxslt.bst
- components/docbook-xsl.bst
- components/perl-pod-parser.bst

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: git_repo
  url: github:mquinson/po4a.git
  track: v*
  ref: v0.74-0-g5d4c70797ee716aefe259fb57bb9c9c416fd2782
