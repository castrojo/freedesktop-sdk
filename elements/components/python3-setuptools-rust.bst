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
    sha256sum: 70a1ca82e2eb9517594585fb4c197e1d39cdee45fe653919fb886c147473cf35
    suffix: 
      b8/56/f6d400708a15dced5fb7c6ff5c52ee1da11e6f4d38d4efef67d7163e6a80/setuptools_rust-1.10.0.tar.gz
