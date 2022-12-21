kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-zipp.bst

sources:
- kind: pypi
  name: importlib-metadata
  ref:
    sha256sum: d5059f9f1e8e41f80e9c56c2ee58811450c31984dfa625329ffd7c0dad88a73b
    suffix: 32/5a/e0d75c8010295ae6746f379f5324bc726076dfc426548bfa6f0763fce870/importlib_metadata-5.1.0.tar.gz
