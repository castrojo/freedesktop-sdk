kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: snowballstemmer
  ref:
    sha256sum: 6d5eeeec8e9f84d4d56b847692bacf79bc2c8e90c7f80ca4444ff8b6f2e52895
    suffix: 
      75/a7/9810d872919697c9d01295633f5d574fb416d47e535f258272ca1f01f447/snowballstemmer-3.0.1.tar.gz
