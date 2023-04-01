kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build
- filename: components/python3-wheel.bst
  type: build

sources:
- kind: pypi
  name: markdown
  ref:
    sha256sum: 8bf101198e004dc93e84a12a7395e31aac6a9c9942848ae1d99b9d72cf9b3520
    suffix: 9d/80/cc67bfb7deb973d5ae662ee6454d2dafaa8f7c106feafd0d1572666ebde5/Markdown-3.4.3.tar.gz
