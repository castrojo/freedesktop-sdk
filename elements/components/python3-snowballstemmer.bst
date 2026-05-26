kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: snowballstemmer
  ref:
    sha256sum: fd9e34526b23340cd23ffea6c9f9760974ecc2c2ac9e1d81401443ccdb2a801f
    suffix: 63/ee/67eef9600338e245ad7838230969a34c823ddbdbccc5e1fc43cd75b55bc9/snowballstemmer-3.1.0.tar.gz
