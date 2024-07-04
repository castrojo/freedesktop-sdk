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
    sha256sum: 8328f2ac2ce3fd773cbb37c765a0ed7a83f89dc564c7d452f039b69249d0ac35
    suffix: 
      78/c9/83f915c3f6f94f4c862c7470284fd714f312cce8e3cf98361312bc02493d/trove_classifiers-2024.7.2.tar.gz
