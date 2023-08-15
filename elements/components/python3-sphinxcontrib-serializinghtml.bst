kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-serializinghtml
  ref:
    sha256sum: aaf3026335146e688fd209b72320314b1b278320cf232e3cda198f873838511a
    suffix: a0/a3/4bd9d8c5c97312bf46b059bcf76eab42ce6ffb12560b7ce9a247e2e524a3/sphinxcontrib_serializinghtml-1.1.8.tar.gz
