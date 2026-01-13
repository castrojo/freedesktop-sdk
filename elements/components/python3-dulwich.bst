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
    sha256sum: bca22c8aa4cbecbe8493b76e3fd6101513f09cf405cd9b92e116a48d9469e55a
    suffix: ba/b8/9c9bc6ac66007f8090b1da9079c0e4bbea5aa9583c3c12098e0f11462dd5/dulwich-0.25.2.tar.gz
