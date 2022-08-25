kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomli
  ref:
    sha256sum: de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f
    suffix: c0/3f/d7af728f075fb08564c5949a9c95e44352e23dee646869fa104a3b2060a3/tomli-2.0.1.tar.gz
