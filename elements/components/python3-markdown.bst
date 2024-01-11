kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: markdown
  ref:
    sha256sum: e1ac7b3dc550ee80e602e71c1d168002f062e49f1b11e26a36264dafd4df2ef8
    suffix: 
      11/28/c5441a6642681d92de56063fa7984df56f783d3f1eba518dc3e7a253b606/Markdown-3.5.2.tar.gz
