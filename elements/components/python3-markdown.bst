kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: markdown
  ref:
    sha256sum: 247b9a70dd12e27f67431ce62523e675b866d254f900c4fe75ce3dda62237c45
    suffix: 
      d7/c2/4ab49206c17f75cb08d6311171f2d65798988db4360c4d1485bd0eedd67c/markdown-3.8.2.tar.gz
- kind: patch
  path: patches/python3-markdown/license.patch
