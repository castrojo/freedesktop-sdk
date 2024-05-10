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
    sha256sum: e36d85967cfbf25da1c7bc3d6921adc5baa976969d926aaf1582bd5fd7e94758
    suffix: 
      cf/ac/cf6420b90832c4ffbc88b92962dd0167c58632c2b8d508d5baf4ecb0c61d/dulwich-0.22.1.tar.gz
