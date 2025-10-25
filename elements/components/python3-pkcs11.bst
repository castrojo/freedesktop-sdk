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
  ref: v0.9.1-0-g22e501ea5d1d3a3c37aa59d1490ae943a282a410
