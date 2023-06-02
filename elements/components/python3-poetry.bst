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
    sha256sum: cc7ea4524d1a11558006224bfe8ba8ed071417d4eb5ef6c89decc6a37d437eeb
    suffix: ab/42/1c8769483f4e72d17fd7b827d11be37a48289d38df40b1d8640ef53d7b33/poetry-1.5.1.tar.gz
