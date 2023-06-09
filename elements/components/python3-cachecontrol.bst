kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: cachecontrol
  ref:
    sha256sum: f012366b79d2243a6118309ce73151bf52a38d4a5dac8ea57f09bd29087e506b
    suffix: 9e/65/3356cfc87bdee0cdf62d941235e936a26c205e4f1e1f2c85dbd952d7533a/cachecontrol-0.13.1.tar.gz
