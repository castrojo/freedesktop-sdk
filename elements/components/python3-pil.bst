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
    sha256sum: d72967b06be9300fed5cfbc8b5bafceec48bf7cdc7dab66b1d2549035287191d
    suffix: 
      64/9e/7e638579cce7dc346632f020914141a164a872be813481f058883ee8d421/Pillow-10.0.1.tar.gz
