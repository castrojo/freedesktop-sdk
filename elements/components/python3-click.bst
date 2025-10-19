kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pallets/click.git
  track: 8.*
  exclude:
  - '8.2.2'
  ref: 8.3.1-0-g0043ebbe62eee17d976f295edbcfb97e77f8372d
