kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  ref:
    sha256sum: 9d48dcccc213325e810fd723e7fbb45ccb39f6cf5c31f00cf2b965f5f10f3cb9
    suffix: 0a/a2/f4b8b82ea966b6c7f66b9099e19ac02dc539f4fe667188113c663e98e784/importlib_resources-6.1.0.tar.gz
