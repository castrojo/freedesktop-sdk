kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython-3.bst
- components/python3-expandvars.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: frozenlist
  ref:
    sha256sum: 81d5af29e61b9c8348e876d442253723928dce6433e0e76cd925cd83f1b4b817
    suffix: 
      8f/ed/0f4cec13a93c02c47ec32d81d11c0c1efbadf4a471e3f3ce7cad366cbbd3/frozenlist-1.5.0.tar.gz
