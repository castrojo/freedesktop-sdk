kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-setuptools.bst
- components/python3-pep8.bst

sources:
- kind: pypi
  name: setuptools_pep8
  ref:
    sha256sum: f620cd7494015729249bda7260c9b94900d6e6ab27df46051fb144c32627080c
    suffix: 20/8a/f75f0126e3809a98b8bd850b93389b35f04958653c3bb5d1b2de5f33c349/setuptools-pep8-0.9.0.tar.gz
