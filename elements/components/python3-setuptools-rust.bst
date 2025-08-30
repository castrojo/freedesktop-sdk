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
    sha256sum: d94a93f0c97751c17014565f07bdc324bee45d396cd1bba83d8e7af92b945f0c
    suffix: 
      bc/c4/8d3d282cee60d3ea0369fa15ce27387810040360adb4133e31990a7a2aba/setuptools_rust-1.12.0.tar.gz
