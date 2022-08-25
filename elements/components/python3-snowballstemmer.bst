kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: snowballstemmer
  ref:
    sha256sum: 09b16deb8547d3412ad7b590689584cd0fe25ec8db3be37788be3810cbf19cb1
    suffix: 44/7b/af302bebf22c749c56c9c3e8ae13190b5b5db37a33d9068652e8f73b7089/snowballstemmer-2.2.0.tar.gz
