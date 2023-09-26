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
    sha256sum: 0169fd70197efda2f8c4d0b2a7a3d614431b488116f37b79d031e9e7ec884d8c
    suffix: af/54/0a75c590c1aa1908c1036de783c0b7136d8fe4beb8ce4c52e4d92b9e9ca7/setuptools-scm-8.0.3.tar.gz
