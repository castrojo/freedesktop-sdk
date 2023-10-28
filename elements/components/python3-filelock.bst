kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/python3-hatch-vcs.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  ref:
    sha256sum: 63c6052c82a1a24c873a549fbd39a26982e8f35a3016da231ead11a5be9dad44
    suffix: 
      6c/93/59c180bd2d637ad8ff58bacd3187abdd1af3a76d26d34a2544cec93dbfcc/filelock-3.13.0.tar.gz
