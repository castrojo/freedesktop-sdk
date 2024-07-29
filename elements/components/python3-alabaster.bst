kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: alabaster
  ref:
    sha256sum: c00dca57bca26fa62a6d7d0a9fcce65f3e026e9bfe33e9c538fd3fbb2144fd9e
    suffix: 
      a6/f8/d9c74d0daf3f742840fd818d69cfae176fa332022fd44e3469487d5a9420/alabaster-1.0.0.tar.gz
