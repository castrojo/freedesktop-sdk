kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/protobuf-base.bst

variables:
  command-subdir: python

(@):
- elements/include/protobuf-source.yml
