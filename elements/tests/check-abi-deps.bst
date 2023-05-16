kind: compose

build-depends:
- components/libabigail.bst
- components/python3-pyelftools.bst
- tests/utils.bst

config:
  exclude:
  - debug
