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
    sha256sum: 0aa6c2489dd5e978b27e9b75983b7331a66c999f0efc54ebe37cab808ed322ae
    suffix: 
      4b/ac/ba58cf420640c7bc77ae8e1b31e174d83c9117750c63cf9ea3b5e202e5c4/dulwich-0.23.0.tar.gz
