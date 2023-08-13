kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-serializinghtml
  ref:
    sha256sum: ca31afee32e1508cff4034e258060ce2c81a3b1c49e77da60fdb61f0e7a73c22
    suffix: 0d/1b/96acc54abc747faa2c9a64b05f12e043eee30de7933181a752cb458d1134/sphinxcontrib_serializinghtml-1.1.7.tar.gz
