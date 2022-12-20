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
- kind: git_repo
  url: gnome:gtk-doc.git
  track: '*.*'
  ref: 1.33.2-0-g14391142ee9d43da116f0f530746ae34cc46930a
