kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: alabaster
  ref:
    sha256sum: 75a8b99c28a5dad50dd7f8ccdd447a121ddb3892da9e53d1ca5cca3106d58d65
    suffix: 
      c9/3e/13dd8e5ed9094e734ac430b5d0eb4f2bb001708a8b7856cbf8e084e001ba/alabaster-0.7.16.tar.gz
