kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst
- components/python3-hatchling.bst
- components/python3-setuptools-scm.bst

sources:
- kind: pypi
  name: hatch-vcs
  ref:
    sha256sum: 093810748fe01db0d451fabcf2c1ac2688caefd232d4ede967090b1c1b07d9f7
    suffix: 
      f5/c9/54bb4fa27b4e4a014ef3bb17710cdf692b3aa2cbc7953da885f1bf7e06ea/hatch_vcs-0.4.0.tar.gz
