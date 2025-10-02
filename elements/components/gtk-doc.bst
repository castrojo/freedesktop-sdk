kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/itstool.bst
- filename: components/docbook-xml.bst
- filename: components/docbook-xsl.bst
- filename: components/pkg-config.bst   # gtk-doc uses pkg-config during runtime.
- filename: components/python3.bst
- filename: components/python3-pygments.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_repo
  url: gnome:gtk-doc.git
  track: '*.*'
  ref: 1.35.0-0-g519e65379a9278950c848084cf6686bdd333567c
