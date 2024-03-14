kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/protobuf-base.bst

variables:
  command-subdir: python

config:
  build-commands:
    (<):
    # Unbreak after https://github.com/protocolbuffers/protobuf/commit/501ececd39fed69f0c50c2c87f04ce75932dde72
    - mv dist/MANIFEST.in MANIFEST.in
    - mv dist/setup.py setup.py

(@):
- elements/include/protobuf-source.yml
