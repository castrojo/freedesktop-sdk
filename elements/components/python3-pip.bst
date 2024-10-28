kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/python3-wheel.bst


sources:
- kind: pypi
  name: pip
  ref:
    sha256sum: ebcb60557f2aefabc2e0f918751cd24ea0d56d8ec5445fe1807f1d2109660b99
    suffix: 
      f4/b1/b422acd212ad7eedddaf7981eee6e5de085154ff726459cf2da7c5a184c1/pip-24.3.1.tar.gz
