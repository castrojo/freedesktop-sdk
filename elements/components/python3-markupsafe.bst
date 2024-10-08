kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

config:
  install-commands:
    (>):
    - find %{install-root} -name '*.c' -delete

sources:
- kind: pypi
  name: markupsafe
  ref:
    sha256sum: 03ff62dea2fef3eadf2f1853bc6332bcb0458d9608b11dfb1cd5aeda1c178ea6
    suffix: 
      5c/84/3f683b24fcffa08c5b7ef3fb8a845661057dd39c321c1ae16fa37a3eb35b/markupsafe-3.0.0.tar.gz
