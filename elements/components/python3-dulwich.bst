kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

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
    sha256sum: e19789842ef6b9d3174db03c3300d9fe63d871f217ac0a8f6ded7b086898907d
    suffix: 
      76/0f/84d09c282c04a6ee7d0a3e0c8fe72ec1eba3129b1a30e82aea18ebdbbd2e/dulwich-0.22.0.tar.gz
