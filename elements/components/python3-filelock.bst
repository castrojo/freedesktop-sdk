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
    sha256sum: 0ecc1dd2ec4672a10c8550a8182f1bd0c0a5088470ecd5a125e45f49472fac3d
    suffix: 
      5a/47/f1f3f5b6da710d5a7178a7f8484d9b86b75ee596fb4fefefb50e8dd2205a/filelock-3.12.3.tar.gz
