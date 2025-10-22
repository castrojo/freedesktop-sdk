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
    sha256sum: e8aebdb52cee481ddc038a2b88376bc28767127fdf3e5ea08b52ae1f60e1e15b
    suffix: 
      18/e7/3d4861edda4d68d9bd0380ce8190601db6ac6d34ca423f2d568e75ad002a/dulwich-0.24.6.tar.gz
