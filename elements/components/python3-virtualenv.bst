kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-hatchling.bst
- components/python3-hatch-vcs.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-appdirs.bst
- components/python3-distlib.bst
- components/python3-filelock.bst
- components/python3-six.bst
- components/python3-pathlib2.bst

sources:
- kind: pypi
  name: virtualenv
  ref:
    sha256sum: ec25a9671a5102c8d2657f62792a27b48f016664c6873f6beed3800008577210
    suffix: 
      d8/02/0737e7aca2f7df4a7e4bfcd4de73aaad3ae6465da0940b77d222b753b474/virtualenv-20.26.0.tar.gz
