kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

config:
  build-commands:
    (<):
    - rm -r tests


sources:
- kind: pypi
  name: pyexpect
  ref:
    sha256sum: 659351e7ee8923b42de8a774fabfc806acf07377d7fd19f2ea4412ef8f619c6a
    suffix: 39/75/6e1cd39922639aece1c946da85cdcb85b91b3ac25f5aeece10ed20b0f065/pyexpect-1.0.22.tar.gz
