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
    sha256sum: 15af5feeaaf8fc89f26abc0d9a1518785b66f1801c3101506400775f2da921d4
    suffix: 
      af/e7/0fcda52b698ea8667279560cd7945021cd18974d650954f2ae16fedeef33/dulwich-0.22.5.tar.gz
- kind: patch
  path: patches/dulwich/fix-missing-import.patch
