kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-typing-extensions.bst

runtime-depends:
- components/python3-frozenlist.bst

sources:
- kind: pypi
  name: aiosignal

  ref:
    sha256sum: f47eecd9468083c2029cc99945502cb7708b082c232f9aca65da147157b251c7
    suffix: 
      61/62/06741b579156360248d1ec624842ad0edf697050bbaf7c3e46394e106ad1/aiosignal-1.4.0.tar.gz
