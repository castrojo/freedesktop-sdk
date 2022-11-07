kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/pip"

sources:
- kind: pypi
  name: pip
  ref:
    sha256sum: 65fd48317359f3af8e593943e6ae1506b66325085ea64b706a998c6e83eeaf38
    suffix: a3/50/c4d2727b99052780aad92c7297465af5fe6eec2dbae490aa9763273ffdc1/pip-22.3.1.tar.gz
