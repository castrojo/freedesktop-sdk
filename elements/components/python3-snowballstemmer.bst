kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: snowballstemmer
  ref:
    sha256sum: 1d09493a5ecc85fb5b433674e9c83fcd41c6739b6979ce4b54e81a40ec078342
    suffix: 
      71/81/f47e97c9850c529ab233fd1cd8319e0e5a1cfae49c87c49ab2fd0a19c744/snowballstemmer-3.0.0.1.tar.gz
