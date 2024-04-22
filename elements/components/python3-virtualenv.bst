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
    sha256sum: 7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be
    suffix: 
      42/28/846fb3eb75955d191f13bca658fb0082ddcef8e2d4b6fd0c76146556f0be/virtualenv-20.25.3.tar.gz
