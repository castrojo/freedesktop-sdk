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
    sha256sum: c1f44d599fa5dc59ca43e0789f835b8689b4d831d8de5ae009c442192a1408b5
    suffix: 
      90/b2/13367fe4b4cb187cf13823040403b37d167c967675d543451caa9e9d2589/dulwich-0.22.6.tar.gz
