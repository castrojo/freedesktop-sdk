kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: pypi
  name: certifi
  ref:
    sha256sum: 84c85a9078b11105f04f3036a9482ae10e4621616db313fe045dd24743a0820d
    suffix: cc/85/319a8a684e8ac6d87a1193090e06b6bbb302717496380e225ee10487c888/certifi-2022.6.15.tar.gz
