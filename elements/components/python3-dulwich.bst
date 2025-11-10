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
    sha256sum: 0d04c4ad1023c8326f08414aec1cb411841b437e19b56fb20799126775a35904
    suffix: 38/9b/d0c5ad41aa8d701a7f0a139c443450a786012ab1b9f69804fbdcce30e074/dulwich-0.24.9.tar.gz
