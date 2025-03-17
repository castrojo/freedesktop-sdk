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
    sha256sum: f765d66f3def6fdc85e1e6d889c6a812aea1430c8dadcf1c7b6779b45f874fb2
    suffix: 
      e0/0c/db5a68b4e95229db38a1793d58561870bd68b92b95fed183c6cd48910c9f/setuptools_rust-1.11.0.tar.gz
