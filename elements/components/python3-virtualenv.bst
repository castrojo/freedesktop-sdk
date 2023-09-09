kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-hatchling.bst
- components/python3-hatch-vcs.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-appdirs.bst
- components/python3-distlib.bst
- components/python3-filelock.bst
- components/python3-six.bst
- components/python3-pathlib2.bst

sources:
- kind: pypi
  name: virtualenv
  ref:
    sha256sum: e8361967f6da6fbdf1426483bfe9fca8287c242ac0bc30429905721cefbff752
    suffix: d3/50/fa955bbda25c0f01297843be105f9d022f461423e69a6ab487ed6cabf75d/virtualenv-20.24.5.tar.gz
