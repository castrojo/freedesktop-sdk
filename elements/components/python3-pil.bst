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
    sha256sum: a64dd61998416367b7ef979b73d3a85853ba9bec4c2925f74e588879a58716b6
    suffix: 
      af/cb/bb5c01fcd2a69335b86c22142b2bccfc3464087efb7fd382eee5ffc7fdf7/pillow-11.2.1.tar.gz
