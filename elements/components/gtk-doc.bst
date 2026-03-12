kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/itstool.bst
- components/docbook-xml.bst
- components/docbook-xsl.bst
- components/pkg-config.bst   # gtk-doc uses pkg-config during runtime.
- components/python3.bst
- components/python3-pygments.bst

sources:
- kind: git_repo
  url: gnome:gtk-doc.git
  track: '*.*'
  ref: 1.36.0-0-g00e02c9587ca0d176451860e711c650afdd56dde
