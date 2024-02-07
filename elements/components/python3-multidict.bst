kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst
- components/cython.bst

sources:
- kind: pypi
  name: multidict
  ref:
    sha256sum: f7e301075edaf50500f0b341543c41194d8df3ae5caf4702f2095f3ca73dd8da
    suffix: 
      f9/79/722ca999a3a09a63b35aac12ec27dfa8e5bb3a38b0f857f7a1a209a88836/multidict-6.0.5.tar.gz
