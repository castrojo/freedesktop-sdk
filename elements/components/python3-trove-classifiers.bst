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
    sha256sum: ff8f7fd82c7932113b46e7ef6742c70091cc63640c8c65db00d91f2e940b9514
    suffix: 
      3d/14/fe9a127564317f1670d1dd2e2e74b9e09fc157563aa2ffbe7d113d004c7a/trove-classifiers-2023.11.29.tar.gz
