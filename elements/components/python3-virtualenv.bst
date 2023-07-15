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
- components/python3-importlib-metadata.bst
- components/python3-importlib-resources.bst
- components/python3-pathlib2.bst

sources:
- kind: pypi
  name: virtualenv
  ref:
    sha256sum: e2a7cef9da880d693b933db7654367754f14e20650dc60e8ee7385571f8593a3
    suffix: 26/c6/169a384bfe44de610f5bbc03b3d4cc23a5a64a75be11864a033f2fe195db/virtualenv-20.24.0.tar.gz
