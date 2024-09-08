kind: pyproject

build-depends:
- components/python3-installer.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst
# Note that these are *also* build dependencies because we
# use build from source root to build wheel of itself
- components/python3-packaging.bst
- components/python3-pyproject-hooks.bst

environment:
  PYTHONPATH: "%{build-root}/src"

sources:
- kind: git_repo
  url: github:pypa/build.git
  track: '*.*.*'
  ref: 1.2.2-0-g3b0b5d07077473f5da3f038cf7b74cd2b65d2a98
