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
    sha256sum: baa84b539fea0e6a925a9159c3e0a1d08cceeea5260732b84200e077444a4b0e
    suffix: 6f/97/f65ab4c7d999bb10c717cace283bfe60dcaa02993ba445574e217ae7c71e/dulwich-0.25.0.tar.gz
