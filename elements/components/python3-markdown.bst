kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: markdown
  ref:
    sha256sum: 7df81e63f0df5c4b24b7d156eb81e4690595239b7d70937d0409f1b0de319c6f
    suffix: 
      2f/15/222b423b0b88689c266d9eac4e61396fe2cc53464459d6a37618ac863b24/markdown-3.8.tar.gz
- kind: patch
  path: patches/python3-markdown/license.patch
