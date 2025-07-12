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
    sha256sum: a152ebb0e95bc0f23768be563f80ff1e719bf5c4f5c2696be4fa8ab625a39879
    suffix: 
      1b/d1/456dd15150702523d7a6cb7a4efc227b6c53226215a60e0c569e7a496979/dulwich-0.23.2.tar.gz
