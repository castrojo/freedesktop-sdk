kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyasn1
  ref:
    sha256sum: 6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034
    suffix: 
      ba/e9/01f1a64245b89f039897cb0130016d79f77d52669aae6ee7b159a6c4c018/pyasn1-0.6.1.tar.gz
