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
    sha256sum: ce50b588981d30cd700fbf7352eea6f9aed9a9fc2823dda5a7d183a4e13d0ab8
    suffix: c1/75/5c1d2c82e4e4542fdc44614f42dafb1c1ec1627a8e8bd5800d37bcb7b33b/dulwich-0.25.1.tar.gz
