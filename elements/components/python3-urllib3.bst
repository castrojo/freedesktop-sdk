kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: pypi
  name: urllib3
  ref:
    sha256sum: 8a388717b9476f934a21484e8c8e61875ab60644d29b9b39e11e4b9dc1c6b305
    suffix: 21/79/6372d8c0d0641b4072889f3ff84f279b738cd8595b64c8e0496d4e848122/urllib3-1.26.15.tar.gz
