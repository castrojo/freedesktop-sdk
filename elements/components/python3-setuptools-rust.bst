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
    sha256sum: d79035fc54cdf9342e9edf4b009491ecab06c3a652b37c3c137c7ba85547d3e6
    suffix: 
      b8/86/4f34594f21f529623b8650fe729548e3a2ad6c9ad81583391f03f74dd11a/setuptools_rust-1.10.1.tar.gz
