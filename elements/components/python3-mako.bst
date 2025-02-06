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
    sha256sum: b5d65ff3462870feec922dbccf38f6efb44e5714d7b593a656be86663d8600ac
    suffix: 
      62/4f/ddb1965901bc388958db9f0c991255b2c469349a741ae8c9cd8a562d70a6/mako-1.3.9.tar.gz
