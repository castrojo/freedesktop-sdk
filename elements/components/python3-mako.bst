kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: mako
  ref:
    sha256sum: e16c01d9ab9c11f7290eef1cfefc093fb5a45ee4a3da09e2fec2e4d1bae54e73
    suffix: 
      0a/dc/48e8853daf4b32748d062ce9cd47a744755fb60691ebc211ca689b849c1c/Mako-1.3.3.tar.gz
