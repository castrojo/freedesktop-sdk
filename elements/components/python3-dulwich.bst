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
    sha256sum: 3d30e11a882817059b134fa9918d2ec5c95c3a3bd2e21034a368cf9e50d27ae3
    suffix: 
      d8/f3/9330472bb717cd7073d71d7ab8c115722d4371889709aebce32209086087/dulwich-0.23.1.tar.gz
