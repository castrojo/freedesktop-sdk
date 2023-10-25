kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pytz.bst

sources:
- kind: pypi
  name: babel
  ref:
    sha256sum: 33e0952d7dd6374af8dbf6768cc4ddf3ccfefc244f9986d4074704f2fbd18900
    suffix: 
      aa/6c/737d2345d86741eeb594381394016b9c74c1253b4cbe274bb1e7b5e2138e/Babel-2.13.1.tar.gz
