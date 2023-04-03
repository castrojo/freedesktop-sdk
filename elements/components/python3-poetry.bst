kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst
- components/python3-poetry-core.bst

runtime-depends:
- components/python3-cachecontrol.bst
- components/python3-cachy.bst
- components/python3-cleo.bst
- components/python3-clikit.bst
- components/python3-html5lib.bst
- components/python3-packaging.bst
- components/python3-pyexpect.bst
- components/python3-requests-toolbelt.bst
- components/python3-requests.bst
- components/python3-shellingham.bst
- components/python3-tomlkit.bst
- components/python3-virtualenv.bst

public:
  bst:
    overlap-whitelist:
    - '%{indep-libdir}/python*/site-packages/poetry/__init__.py'
    - '%{indep-libdir}/python*/site-packages/poetry/__pycache__/__init__.cpython-*.pyc'

sources:
- kind: pypi
  name: poetry
  ref:
    sha256sum: 0bd580a42482579635e774c5286ef73b8df3427567123cdb128b286cec671b3c
    suffix: b2/8f/664c5d6fb391421606f2641b22542fecc1a785b508b6618c8726c2eb0a79/poetry-1.4.2.tar.gz
