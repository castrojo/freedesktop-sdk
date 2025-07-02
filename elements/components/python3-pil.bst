kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3-setuptools.bst
- components/jpeg.bst

sources:
- kind: pypi
  name: Pillow
  ref:
    sha256sum: 3828ee7586cd0b2091b6209e5ad53e20d0649bbe87164a459d0676e035e8f523
    suffix: 
      f3/0d/d0d6dea55cd152ce3d6767bb38a8fc10e33796ba4ba210cbab9354b6d238/pillow-11.3.0.tar.gz
- kind: patch
  path: patches/python3-pil/license.patch
