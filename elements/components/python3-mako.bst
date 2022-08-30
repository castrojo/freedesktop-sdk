kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst
- components/python3-markupsafe.bst

public:
  cpe:
    version-match: '(\d+)_(\d*)_(\d*)'

sources:
- kind: git_tag
  url: github:sqlalchemy/mako.git
  track: main
  ref: rel_1_2_2-0-g5054cc07ce6a957143251d32a963b8e0e437457a
