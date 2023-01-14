kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-urllib3.bst
- components/python3-certifi.bst
- components/python3-idna.bst
- components/python3-chardet.bst
- components/python3-charset-normalizer.bst

sources:
- kind: pypi
  name: requests
  ref:
    sha256sum: 98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf
    suffix: 9d/ee/391076f5937f0a8cdf5e53b701ffc91753e87b07d66bae4a09aa671897bf/requests-2.28.2.tar.gz
