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
    sha256sum: baee30b9c61718e093130298e678abed0dbfa1b411fcc4c1ab4df87cd631a0f2
    suffix: 
      9c/cf/947dfd8475332b603dc8cb46170a7c333415f6ff1b161896ee76b4358435/Mako-1.3.1.tar.gz
