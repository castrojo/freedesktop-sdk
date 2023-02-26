kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst

environment:
  PYTHONPATH: src

sources:
- kind: git_repo
  url: github:pypa/wheel.git
  track: '*.*.*'
  ref: 0.38.4-0-g814c2efe8e40051039c5a6de6945e04ecdd162ee
- kind: local
  path: files/python3-wheel/pyproject.toml
