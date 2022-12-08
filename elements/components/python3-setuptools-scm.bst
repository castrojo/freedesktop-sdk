kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git-minimal.bst
- components/python3-typing-extensions.bst
- components/python3-packaging.bst

runtime-depends:
- components/python3-tomli.bst

sources:
- kind: pypi
  name: setuptools_scm
  ref:
    sha256sum: 031e13af771d6f892b941adb6ea04545bbf91ebc5ce68c78aaf3fff6e1fb4844
    suffix: d0/43/f038b5009f93bcd77b1b8da9e6d424b739ab17aec9726f3a99eba23d53ca/setuptools_scm-7.0.5.tar.gz
