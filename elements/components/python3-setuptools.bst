kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: ac4008d396bc9cd983ea483cb7139c0240a07bbc74ffb6232fceffedc6cf03a8
    suffix: 3c/7b/00030a938499c8f8345be02ab5b7d748d359ea59c2f020b7b0a21b82f832/setuptools-66.1.1.tar.gz
