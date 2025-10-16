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
    sha256sum: 45b91906c6fc71bb6300258141fe91e63e7b70d5fd010f0482858ea681d9af62
    suffix: 
      64/17/050c732fe4cdc39009c44c6fb626e9cda5405cee536b3ef0647ecb6e28b9/dulwich-0.24.4.tar.gz
