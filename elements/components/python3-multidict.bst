kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: multidict
  ref:
    sha256sum: 2cf3e0781febf9f093eff3eca2d6dd7954ef2969ff46f6cd95173a4db8397fd8
    suffix: 
      99/68/42bf1fb4272959aa7c0775caf53265c1a0da9d77f2d4e76326296c943811/multidict-6.3.0.tar.gz
