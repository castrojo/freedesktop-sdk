kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst
- components/python3-setuptools-rust.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-certifi.bst
- components/python3-urllib3.bst

# We don't use git because we can't mirror the repository as it contains
# invalid commits (that don't pass git fsck)
sources:
- kind: pypi
  name: dulwich
  ref:
    sha256sum: d474844cf81bf95a6537a80aeec59d714d5d77d8e83d6d37991e2bde54746ca7
    suffix: 
      82/d0/b1275f9609e0d32800daf72786e5bec5602e71dde8db4995d0420d6b5cec/dulwich-0.24.2.tar.gz
