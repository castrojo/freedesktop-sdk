kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

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
    sha256sum: f8b927684efc6f1cc206c9db297a570ab9ad0e51c16fa9e45487d36d1905c058
    suffix: 7b/19/65f13cff26c8cc11fdfcb0499cd8f13388dd7b35a79a376755f152b42d86/virtualenv-20.17.1.tar.gz
