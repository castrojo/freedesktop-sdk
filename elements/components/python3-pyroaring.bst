kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
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
    sha256sum: 20529ed1e71bf4b49536994445037e6a1c06697ebf5a2b8d73190f88c0cfa232
    suffix: ec/86/20906a65021bf7ad20c0d6b4260ccd9cae3ffabfd7545fb5238e5c9e3f26/pyroaring-0.4.4.tar.gz
