kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-applehelp
  ref:
    sha256sum: 828f867945bbe39817c210a1abfd1bc4895c8b73fcaade56d45357a348a07d7e
    suffix: 32/df/45e827f4d7e7fcc84e853bcef1d836effd762d63ccb86f43ede4e98b478c/sphinxcontrib-applehelp-1.0.4.tar.gz
