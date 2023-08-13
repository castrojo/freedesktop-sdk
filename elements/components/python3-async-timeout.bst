kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: async-timeout
  ref:
    sha256sum: 4640d96be84d82d02ed59ea2b7105a0f7b33abe8703703cd0ab0bf87c427522f
    suffix: 87/d6/21b30a550dafea84b1b8eee21b5e23fa16d010ae006011221f33dcd8d7f8/async-timeout-4.0.3.tar.gz
