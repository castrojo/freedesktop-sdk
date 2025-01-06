kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pygments
  ref:
    sha256sum: afc4146269910d4bdfabcd27c24923137a74d562a23a320a41a55ad303e19783
    suffix: 
      d3/c0/9c9832e5be227c40e1ce774d493065f83a91d6430baa7e372094e9683a45/pygments-2.19.0.tar.gz
