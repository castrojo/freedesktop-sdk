kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst
- components/python3-urllib3.bst
- components/python3-certifi.bst
- components/python3-idna.bst
- components/python3-chardet.bst
- components/python3-charset-normalizer.bst

sources:
- kind: pypi
  name: requests
  ref:
    sha256sum: 27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422
    suffix: 
      e1/0a/929373653770d8a0d7ea76c37de6e41f11eb07559b103b1c02cafb3f7cf8/requests-2.32.4.tar.gz
