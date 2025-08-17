kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git-minimal.bst
- components/python3-typing-extensions.bst
- components/python3-packaging.bst

sources:
- kind: pypi
  name: setuptools_scm
  ref:
    sha256sum: 6662c9b9497b6c9bf13bead9d7a9084756f68238302c5ed089fb4dbd29d102d7
    suffix: 
      8f/8d/ffdcace33d0480d591057a30285b7c33f8dc431fed3fff7dbadf5f9f128f/setuptools_scm-9.2.0.tar.gz
