kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: Jinja2
  ref:
    sha256sum: 31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852
    suffix: 7a/ff/75c28576a1d900e87eb6335b063fab47a8ef3c8b4d88524c4bf78f670cce/Jinja2-3.1.2.tar.gz
