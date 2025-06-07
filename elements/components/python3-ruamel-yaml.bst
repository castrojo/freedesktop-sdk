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
    sha256sum: b0d5ac0a2b0b4e39d87aed00ddff26e795de6750b064da364a8d009b97ce5f26
    suffix: 
      aa/f9/0e3b3a678d087f8067249ecc9f2434428a93442004be86faed201ac7aeee/ruamel.yaml-0.18.13.tar.gz
