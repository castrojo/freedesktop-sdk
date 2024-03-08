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

public:
  cpe:
    version: '1.32'

sources:
- kind: git_tag
  url: gnome:gtk-doc.git
  track: master
  ref: 1.34.0-0-gb7c8317bf023b5116250b4c5381737d5b9786976
