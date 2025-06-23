kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

depends:
- components/python3-setuptools.bst
- components/jpeg.bst

sources:
- kind: git_repo
  url: github:python-pillow/Pillow.git
  track: "*.*.*"
  ref: 12.1.1-0-g5158d98c807e719c5938aa3886913ef0ea6814e9
- kind: patch
  path: patches/python3-pil/drop-pybind.patch
