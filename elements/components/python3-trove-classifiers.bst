kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-calver.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: trove-classifiers
  ref:
    sha256sum: 8a8e168b51d20fed607043831d37632bb50919d1c80a64e0f1393744691a8b22
    suffix: 8b/2b/46dde7e5df5f2b22e35d060d1e3ec2ec68c6c89f85e00273ea67585e4237/trove-classifiers-2023.7.6.tar.gz
