kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3-setuptools.bst
- components/jpeg.bst

sources:
- kind: pypi
  name: Pillow
  ref:
    sha256sum: c935a22a557a560108d780f9a0fc426dd7459940dc54faa49d83249c8d3e760f
    suffix: 16/11/da8d395299ca166aa56d9436e26fe8440e5443471de16ccd9a1d06f5993a/Pillow-9.3.0.tar.gz
