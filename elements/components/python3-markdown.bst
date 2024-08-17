kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: markdown
  ref:
    sha256sum: 2ae2471477cfd02dbbf038d5d9bc226d40def84b4fe2986e49b59b6b472bbed2
    suffix: 
      54/28/3af612670f82f4c056911fbbbb42760255801b3068c48de792d354ff4472/markdown-3.7.tar.gz
