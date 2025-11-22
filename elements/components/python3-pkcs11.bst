kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-asn1crypto.bst

sources:
- kind: git_repo
  url: github:pyauth/python-pkcs11.git
  track: v*
  ref: v0.9.2-0-g8f8963c8a52b549512a067c598eeeb6969042e24
