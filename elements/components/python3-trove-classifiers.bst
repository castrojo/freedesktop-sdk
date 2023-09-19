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
    sha256sum: 3e700af445c802f251ce2b741ee78d2e5dfa5ab8115b933b89ca631b414691c9
    suffix: de/49/24c1cae3acdd6876c7770da36547b349b93908a34a67d68ef99eca0daf75/trove-classifiers-2023.9.19.tar.gz
