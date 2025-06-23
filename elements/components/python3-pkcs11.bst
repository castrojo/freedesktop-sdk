kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

build-depends:
  (>):
  - components/cython.bst
  - components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-asn1crypto.bst

sources:
- kind: git_repo
  url: github:pyauth/python-pkcs11.git
  track: v*
  ref: v0.9.3-0-g2c4c6c74459d9a18d17766bcecd7c101c616b305
