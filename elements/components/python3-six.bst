kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: six
  ref:
    sha256sum: ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81
    suffix: 
      94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz
