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
    sha256sum: c1e8b8b0523c0361a78ce9b99d9850c51cf25e1fa3c5686030ce75df6fdf2918
    suffix: 
      03/5d/d72502cd6dd64b0c5a5117b1701f05c38e94ffb4a1b4ab65ff0cd9b974e8/multidict-6.6.2.tar.gz
