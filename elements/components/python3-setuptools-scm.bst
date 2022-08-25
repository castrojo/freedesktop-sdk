kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/git.bst
- components/python3.bst
- components/python3-packaging.bst
- components/python3-setuptools.bst
- components/python3-typing-extensions.bst

runtime-depends:
- components/python3-tomli.bst

sources:
- kind: pypi
  name: setuptools_scm
  ref:
    sha256sum: 53afbaa882f43e5ec8e14f2d93b9c268dc62eb3f6cc8b2790f8cb97903e53c02
    suffix: 43/70/aff5e3c2463b08997e21f5f961d6ebfd32ce56d6026394664d6a10090cbb/setuptools_scm-7.0.2.tar.gz
