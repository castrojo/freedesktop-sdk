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
    sha256sum: af37434d3b991ce5c167f0192d3567128668664f4c4f1b12ddbe817b80444c8d
    suffix: 
      9b/5d/f94b8c44960e652e070c1bc7f93f6535414bb93fad5acc3757bc605bf0fb/pyroaring-1.0.0.tar.gz
