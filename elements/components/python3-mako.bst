kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: mako
  ref:
    sha256sum: 2a0c8ad7f6274271b3bb7467dd37cf9cc6dab4bc19cb69a4ef10669402de698e
    suffix: 
      d4/1b/71434d9fa9be1ac1bc6fb5f54b9d41233be2969f16be759766208f49f072/Mako-1.3.2.tar.gz
