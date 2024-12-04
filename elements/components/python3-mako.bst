kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: mako
  ref:
    sha256sum: 20405b1232e0759f0e7d87b01f6bb94fce0761747f1cb876ecf90bd512d0b639
    suffix: 
      5a/27/5af876b41cebd9d76fa8333b83ef9121726893f725952022edd194a1671e/mako-1.3.7.tar.gz
