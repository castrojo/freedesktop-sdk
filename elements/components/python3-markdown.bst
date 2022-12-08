kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: markdown
  ref:
    sha256sum: 3b809086bb6efad416156e00a0da66fe47618a5d6918dd688f53f40c8e4cfeff
    suffix: 85/7e/133e943e97a943d2f1d8bae0c5060f8ac50e6691754eb9dbe036b047a9bb/Markdown-3.4.1.tar.gz
