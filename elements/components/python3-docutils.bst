kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: pypi
  name: docutils
  ref:
    sha256sum: ba9d57750e92331ebe7c08a1bbf7a7f8143b86c476acd51528b042216a6aad0f
    suffix: 
      e9/86/5b41c32ecedcfdb4c77b28b6cb14234f252075f8cdb254531727a35547dd/docutils-0.22.tar.gz
