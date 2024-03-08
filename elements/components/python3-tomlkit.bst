kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

# Don't convert to git
# See https://github.com/sdispater/tomlkit/issues/322
sources:
- kind: pypi
  name: tomlkit
  ref:
    sha256sum: 7ca1cfc12232806517a8515047ba66a19369e71edf2439d0f5824f91032b6cc3
    suffix: 
      7d/49/4c0764898ee67618996148bdba4534a422c5e698b4dbf4001f7c6f930797/tomlkit-0.12.4.tar.gz
