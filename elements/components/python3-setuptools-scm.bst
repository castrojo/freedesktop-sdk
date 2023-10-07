kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git-minimal.bst
- components/python3-typing-extensions.bst
- components/python3-packaging.bst
- components/python3-tomli.bst

sources:
- kind: pypi
  name: setuptools_scm
  ref:
    sha256sum: b5f43ff6800669595193fd09891564ee9d1d7dcb196cab4b2506d53a2e1c95c7
    suffix: eb/b1/0248705f10f6de5eefe7ff93e399f7192257b23df4d431d2f5680bb2778f/setuptools-scm-8.0.4.tar.gz
