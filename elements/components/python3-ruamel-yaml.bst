kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-ruamel-yaml-clib.bst

sources:
- kind: pypi
  name: ruamel.yaml
  ref:
    sha256sum: 5a38fd5ce39d223bebb9e3a6779e86b9427a03fb0bf9f270060f8b149cffe5e2
    suffix: 
      56/2f/5a4dd48a259cb72d6f972abb728d3b219b50980fe3b7c548e0be7c5f56aa/ruamel.yaml-0.18.12.tar.gz
