kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

runtime-depends:
- components/python3.bst
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: Jinja2
  ref:
    sha256sum: 8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb
    suffix: 
      af/92/b3130cbbf5591acf9ade8708c365f3238046ac7cb8ccba6e81abccb0ccff/jinja2-3.1.5.tar.gz
