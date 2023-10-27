kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/docbook-xsl.bst
- components/libxslt.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:asciidoc-py/asciidoc-py.git
  track: '*.*.*'
  ref-format: git-describe
  ref: 10.2.0-0-g545b79b8d7dae70d12bf0657359bdd36de0c5c26
