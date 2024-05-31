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
  ref: 2024.1-0-geff4ec3d21df38c9d857bcf58aa98437c6610489
