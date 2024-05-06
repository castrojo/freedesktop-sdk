kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-contextlib2.bst

sources:
- kind: pypi
  name: schema
  ref:
    sha256sum: 7da553abd2958a19dc2547c388cde53398b39196175a9be59ea1caf5ab0a1807
    suffix: 
      d4/01/0ea2e66bad2f13271e93b729c653747614784d3ebde219679e41ccdceecd/schema-0.7.7.tar.gz
