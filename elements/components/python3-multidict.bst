kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: multidict
  ref:
    sha256sum: 460b213769cb8691b5ba2f12e53522acd95eb5b2602497d4d7e64069a61e5941
    suffix: 
      aa/6d/84d6dbf9a855c09504bdffd4a2c82c6b82cc7b4d69101b64491873967d88/multidict-6.6.0.tar.gz
