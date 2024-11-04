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
    sha256sum: 7e65c31d90a159a9e4d0e18c36c36d2bef4494f623f2560973d8e1cc296049a3
    suffix: 
      83/56/5f1fb0cc82f8e85fa4f77645fd4d18540046366e947dd3895c107e7ea9ac/dulwich-0.22.4.tar.gz
