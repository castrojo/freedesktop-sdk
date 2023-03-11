kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: toposort
  ref:
    sha256sum: bfbb479c53d0a696ea7402601f4e693c97b0367837c8898bc6471adfca37a6bd
    suffix: 69/19/8e955d90985ecbd3b9adb2a759753a6840da2dff3c569d412b2c9217678b/toposort-1.10.tar.gz
