kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

runtime-depends:
- components/python3-tomli.bst

depends:
- components/python3.bst
- components/python3-semantic-version.bst
- components/python3-setuptools.bst
- components/python3-typing-extensions.bst

sources:
- kind: pypi
  name: setuptools-rust
  ref:
    sha256sum: c7100999948235a38ae7e555fe199aa66c253dc384b125f5d85473bf81eae3a3
    suffix: 90/f1/70b31cacce03bf21fa645d359d6303fb5590c1a02c41c7e2df1c480826b4/setuptools-rust-1.7.0.tar.gz
