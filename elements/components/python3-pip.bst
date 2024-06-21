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
    sha256sum: bdae551038c0ce6a83030b4aedef27fc95f0daa683593fea22fa05e55ed8e317
    suffix: 
      df/60/7538a9cd4d76829c2f585b73d6e400c833a1769408451c813354c58de6cc/pip-24.1.tar.gz
