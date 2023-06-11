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
    sha256sum: a85caa554ced0c0afbd0d638e7e2d7b5f92d23478d05d17a76daeac8f279f924
    suffix: d6/37/3ff25b2ad0d51cfd752dc68ee0ad4387f058a5ceba4d89b47ac478de3f59/virtualenv-20.23.0.tar.gz
