kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/pkg-config.bst

depends:
- components/python3.bst
- components/libversion.bst

sources:
- kind: git_repo
  url: github:repology/py-libversion
  track: '*.*.*'
  ref: 1.2.4-0-g9350dfe00ea730d0fe5b5ecb6388c3a64633a431
