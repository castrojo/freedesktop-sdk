kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:akornatskyy/wheezy.template.git
  track: '*.*.*'
  ref: 3.2.1-0-g00ba98060f2302418c7551ae8c5d513f264dd6ae
