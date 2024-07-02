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
    sha256sum: 3529595c443758741a8e34af06704d7468fd92ad77d17f9159a6f3a6815a64c2
    suffix: 
      8f/e4/6d5f4da8434ab56bcf2469bca9fe969de2f10bb1d93db586fc971b6cf92d/trove_classifiers-2024.7.1.tar.gz
