kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pyparsing.bst

sources:
- kind: pypi
  name: packaging
  ref:
    sha256sum: 026ed72c8ed3fcce5bf8950572258698927fd1dbda10a5e981cdf0ac37f4f002
    suffix: 
      51/65/50db4dda066951078f0a96cf12f4b9ada6e4b811516bf0262c0f4f7064d4/packaging-24.1.tar.gz
