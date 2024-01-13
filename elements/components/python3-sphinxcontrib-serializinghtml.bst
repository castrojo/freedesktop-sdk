kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-serializinghtml
  ref:
    sha256sum: 93f3f5dc458b91b192fe10c397e324f262cf163d79f3282c158e8436a2c4511f
    suffix: 
      54/13/8dd7a7ed9c58e16e20c7f4ce8e4cb6943eb580955236d0c0d00079a73c49/sphinxcontrib_serializinghtml-1.1.10.tar.gz
