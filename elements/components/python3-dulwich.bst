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
    sha256sum: f10bffa1395a8dedc3d38ac05164f761ae838a6a18f9a09a966f27dd651850d4
    suffix: 
      3a/40/ac6b7a749395edacd057278ac30cd66f15261581fe20c440327aa6fa9c5e/dulwich-0.24.7.tar.gz
