kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-jinja2.bst
- components/python3-markdown.bst
- components/python3-markupsafe.bst
- components/python3-pygments.bst
- components/python3-typogrify.bst

sources:
- kind: git_repo
  url: gnome:gi-docgen.git
  track: '*.*'
  ref-format: git-describe
  ref: 2023.1-0-g63b4fad4181e793f34b7777a89e5cb58fe8ac7e6
