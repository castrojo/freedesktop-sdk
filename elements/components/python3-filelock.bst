kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-hatchling.bst
- components/python3-hatch-vcs.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  ref:
    sha256sum: 3618c0da67adcc0506b015fd11ef7faf1b493f0b40d87728e19986b536890c37
    suffix: e6/3d/c80975c1028f54e4f0fe6f727d9271362b749321144ea833216b18bfda93/filelock-3.11.0.tar.gz
