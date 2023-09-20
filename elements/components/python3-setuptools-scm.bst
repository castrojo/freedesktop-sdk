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
    sha256sum: e69bf0b8265fdc8f4e070c98235b1b0816ffa8b7f91153400404bf68496012e3
    suffix: a7/16/8aef42ae27036ceb201f1774940357da18ae7daac45bdd721da554892012/setuptools-scm-8.0.1.tar.gz
