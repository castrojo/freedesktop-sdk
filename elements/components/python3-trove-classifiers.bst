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
    sha256sum: d47a6f1c48803091c3fc81f535fecfeef65b558f2b9e4e83df7a79d17bce8bbf
    suffix: 
      b9/8d/7899dd731149418618522eb6846acae3f0edf0823d7ae54bb732d4140c95/trove_classifiers-2024.5.17.tar.gz
