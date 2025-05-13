kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython-3.bst
- components/git-minimal.bst

depends:
- components/python3.bst

environment:
  # -march=native can be problematic and could generate binary that
  # does not work on other builders. It is also not available on
  # ppc64
  ARCHI: generic

sources:
- kind: pypi
  name: pyroaring
  ref:
    sha256sum: e0ab5f8a18a7ba99b8f7a152dca300ef5bd9eff0a7df56a08714114497b63f10
    suffix:
      6a/3d/eb76bd6b8e0afe478206c274a328382fcda8788bb9e52d63c3035bb75f95/pyroaring-1.0.1.tar.gz
