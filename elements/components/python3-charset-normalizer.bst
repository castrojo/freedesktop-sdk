kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: charset-normalizer
  ref:
    sha256sum: 223217c3d4f82c3ac5e29032b3f1c2eb0fb591b72161f86d93f5719079dae93e
    suffix: 
      f2/4f/e1808dc01273379acc506d18f1504eb2d299bd4131743b9fc54d7be4df1e/charset_normalizer-3.4.0.tar.gz
