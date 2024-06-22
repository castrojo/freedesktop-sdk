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
  ref: v0.73-0-g87732c7824c75f563d57f286535c4991f2eac25f
