kind: modulebuild

build-depends:
- bootstrap/make.bst
- bootstrap/diffutils.bst
- components/gettext.bst
- components/docbook-xsl.bst
- components/gettext.bst
- components/libxslt.bst
- components/perl-build.bst
- components/perl-pod-parser.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst

sources:
- kind: git_repo
  url: github:mquinson/po4a.git
  track: v*
  ref: v0.73-0-g87732c7824c75f563d57f286535c4991f2eac25f
