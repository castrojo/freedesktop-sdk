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
    sha256sum: d53935832dd182d4c1415042187093efcee988af5cd397fb1f394f5bb27f0707
    suffix: 
      67/57/b4962be0410cf15dc7758fcc40337d09515cc74ac15e45d304f8b70c9b40/dulwich-0.22.7.tar.gz
