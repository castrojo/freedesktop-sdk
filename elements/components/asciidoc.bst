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
    sha256sum: d9f13c285981b3c7eb660d02ca0a2779981e88d48105de81bb40445e60dddb83
    suffix: 
      1d/e7/315a82f2d256e9270977aa3c15e8fe281fd7c40b8e2a0b97e0cb61ca8fa0/asciidoc-10.2.1.tar.gz
