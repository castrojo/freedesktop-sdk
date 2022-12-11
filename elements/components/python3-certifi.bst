kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: certifi
  ref:
    sha256sum: 35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3
    suffix: 37/f7/2b1b0ec44fdc30a3d31dfebe52226be9ddc40cd6c0f34ffc8923ba423b69/certifi-2022.12.7.tar.gz
