kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/pkg-config.bst
- components/python3-pkgconfig.bst
- components/python3-pycparser.bst
- components/python3-setuptools-scm.bst
- components/tpm2-tss.bst

depends:
- components/python3.bst
- components/python3-cffi.bst
- components/python3-cryptography.bst
- components/python3-packaging.bst
- components/python3-asn1crypto.bst

sources:
- kind: git_repo
  url: github:tpm2-software/tpm2-pytss.git
  track: '*.*.*'
  exclude:
  - '*a*'
  - '*b*'
  - '*rc*'
  ref: 2.2.1-0-g70a4ccc850bd9dba05043a90f08f818a1860826c
