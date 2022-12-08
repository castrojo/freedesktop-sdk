kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: wheezy.template
  include:
  - '0.1.167'
  ref:
    sha256sum: a2ee933452f0352fb8587d79bf6fc66dbf3a14779ef7d17b9fa75e80c0003f19
    suffix: b1/67/7f0a14a4cc9bd949b8d22383c26fec83a00e7bd428e15c697f998e3e37ba/wheezy.template-0.1.167.tar.gz
