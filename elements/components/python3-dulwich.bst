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
    sha256sum: 502079fe552a85b187542ae63587745279ecb01bbff0afa98f12e53b695e1f38
    suffix: 
      46/bd/660f8e45a4e9dab4fa6a92fcfb392dd84d99909548c17e85e05cb172f14d/dulwich-0.24.5.tar.gz
