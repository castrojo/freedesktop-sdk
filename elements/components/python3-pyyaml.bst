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
- kind: pypi
  name: pyyaml
  ref:
    sha256sum: 826fb4d5ac2c48b9d6e71423def2669d4646c93b6c13612a71b3ac7bb345304b
    suffix: ff/08/b6768d9f2da231c1396490e91471ffebb12b299a65cb369c27ec0e2a50c6/pyyaml-6.0.2rc1.tar.gz
