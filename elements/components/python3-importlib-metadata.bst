kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-zipp.bst

sources:
- kind: pypi
  name: importlib-metadata
  ref:
    sha256sum: 23c2bcae4762dfb0bbe072d358faec24957901d75b6c4ab11172c0c982532402
    suffix: c2/84/ab374b7e05fbdeecf867294660ac0fdb23aa286aca68a31d587f67d181ad/importlib_metadata-6.3.0.tar.gz
