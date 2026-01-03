kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3-setuptools.bst
- components/jpeg.bst

sources:
- kind: git_repo
  url: github:python-pillow/Pillow.git
  track: "*.*.*"
  ref: 12.1.0-0-g46f45f674d47b5d8bc54230dda8fe9e214598b87
- kind: patch
  path: patches/python3-pil/drop-pybind.patch
