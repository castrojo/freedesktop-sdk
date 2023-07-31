kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyparsing
  ref:
    sha256sum: ede28a1a32462f5a9705e07aea48001a08f7cf81a021585011deba701581a0db
    suffix: 37/fe/65c989f70bd630b589adfbbcd6ed238af22319e90f059946c26b4835e44b/pyparsing-3.1.1.tar.gz
