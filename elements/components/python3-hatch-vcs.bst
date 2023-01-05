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
    sha256sum: cec5107cfce482c67f8bc96f18bbc320c9aa0d068180e14ad317bbee5a153fee
    suffix: 04/33/b68d68e532392d938472d16a03e4ce0ccd749ea31b42d18f8baa6547cbfd/hatch_vcs-0.3.0.tar.gz
