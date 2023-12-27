kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
# https://github.com/yaml/pyyaml/issues/601
- components/cython-0.29.bst

depends:
- components/python3.bst
- components/libyaml.bst

sources:
- kind: pypi
  name: pyyaml
  ref:
    sha256sum: bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43
    suffix: cd/e5/af35f7ea75cf72f2cd079c95ee16797de7cd71f29ea7c68ae5ce7be1eda0/PyYAML-6.0.1.tar.gz
