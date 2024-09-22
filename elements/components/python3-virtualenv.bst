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
    sha256sum: ce489cac131aa58f4b25e321d6d186171f78e6cb13fafbf32a840cee67733ff4
    suffix: 
      bf/4c/66ce54c8736ff164e85117ca36b02a1e14c042a6963f85eeda82664fda4e/virtualenv-20.26.5.tar.gz
