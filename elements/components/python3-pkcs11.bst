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
  ref: v0.10.1-0-gc7be814c939a59b75d60d6a649bf8116537e69b4
