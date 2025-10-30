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
    sha256sum: c9f4748bbcca56fb57458c71c0d30e2351ac15e0583d428c739c09228be68f05
    suffix: 58/98/b6b8bf80e61d1aacf59aad4e45e6a1e7c39751c7bcaeb1136821bae82cd8/dulwich-0.24.8.tar.gz
