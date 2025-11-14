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
    sha256sum: 30e028979b6fa7220c913da9c786026611c10746c06496149742602b36a11f6b
    suffix: 3e/7c/cb4a5fb0d3d0f6585894759730ae9052e8dd9d2e5172bff544d369b24243/dulwich-0.24.10.tar.gz
