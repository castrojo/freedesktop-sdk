kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/python3.bst
- components/libyaml.bst

config:
  # FIXME: We need to skip build dependency check since pyyaml only allows building with
  # Cython 3 on Python 3.13 or newer
  build-commands:
  - |
    %{python} -mbuild %{build-args} --skip-dependency-check .


sources:
- kind: git_repo
  url: github:yaml/pyyaml.git
  track: '*.*.*'
  exclude:
  - "*rc*"
  - "*b*"
  ref: 6.0.3-0-g49790e73684bebad1df05ef8d828fa12f685bffb
