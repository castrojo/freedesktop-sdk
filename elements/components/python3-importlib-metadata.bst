kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-zipp.bst

sources:
- kind: pypi
  name: importlib-metadata
  ref:
    sha256sum: eb1a7933041f0f85c94cd130258df3fb0dec060ad8c1c9318892ef4192c47ce1
    suffix: 20/fc/a0e728307f38609ef849d813c95dc974d344a3d395f62013ddcd8fbe0bfe/importlib_metadata-6.4.1.tar.gz
