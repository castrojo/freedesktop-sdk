kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst
- components/python3-idna.bst
- components/python3-multidict.bst

environment:
  YARL_NO_EXTENSIONS: '1'

sources:
- kind: pypi
  name: yarl
  ref:
    sha256sum: 49d43402c6e3013ad0978602bf6bf5328535c48d192304b91b97a3c6790b1562
    suffix: c4/1e/1b204050c601d5cd82b45d5c8f439cb6f744a2ce0c0a6f83be0ddf0dc7b2/yarl-1.8.2.tar.gz
