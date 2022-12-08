kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-semantic-version.bst
- components/python3-setuptools.bst
- components/python3-typing-extensions.bst

sources:
- kind: pypi
  name: setuptools-rust
  ref:
    sha256sum: d8daccb14dc0eae1b6b6eb3ecef79675bd37b4065369f79c35393dd5c55652c7
    suffix: 99/db/e4ecb483ffa194d632ed44bda32cb740e564789fed7e56c2be8e2a0e2aa6/setuptools-rust-1.5.2.tar.gz
