kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/docbook-xsl.bst
- components/libxslt.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: asciidoc
  ref:
    sha256sum: 91ff1dd4c85af7b235d03e0860f0c4e79dd1ff580fb610668a39b5c77b4ccace
    suffix: 8a/57/50180e0430fdb552539da9b5f96f1da6f09c4bfa951b39a6e1b4fbe37d75/asciidoc-10.2.0.tar.gz
