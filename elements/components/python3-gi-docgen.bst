kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-jinja2.bst
- components/python3-markdown.bst
- components/python3-markupsafe.bst
- components/python3-packaging.bst
- components/python3-pygments.bst
- components/python3-typogrify.bst

sources:
- kind: git_repo
  url: gnome:gi-docgen.git
  track: '*.*'
  ref-format: git-describe
  ref: 2023.3-0-g96f2e9b93e1d8a5338eb05b87fd879856ab7b3cc
