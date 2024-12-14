kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-frozenlist.bst

sources:
- kind: pypi
  name: aiosignal

  ref:
    sha256sum: a8c255c66fafb1e499c9351d0bf32ff2d8a0321595ebac3b93713656d2436f54
    suffix: 
      ba/b5/6d55e80f6d8a08ce22b982eafa278d823b541c925f11ee774b0b9c43473d/aiosignal-1.3.2.tar.gz
