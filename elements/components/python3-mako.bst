kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst
- components/python3-markupsafe.bst

public:
  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'

sources:
- kind: git_repo
  url: github:sqlalchemy/mako.git
  track: "rel_*"
  ref: rel_1_4_1-0-g79dcdf847284b3a79e25bd3795621ce58f9e3439
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
