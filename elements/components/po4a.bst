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
  ref: v0.72-0-g1698935b5eb8f9c743de8af14a2f71ba8bf6e3d8
