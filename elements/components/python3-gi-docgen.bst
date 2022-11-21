kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-jinja2.bst
- components/python3-markdown.bst
- components/python3-markupsafe.bst
- components/python3-pygments.bst
- components/python3-toml.bst
- components/python3-typogrify.bst

sources:
- kind: pypi
  name: gi-docgen
  ref:
    sha256sum: fc56df0c7d4ab9e5ed83f35b7483cb07d0bf91761e4f139eed363d7e42ffe0c0
    suffix: 4d/0d/84d2a72a79ba7874b34680cac5b81019f17d58f2b53d88f341c710f1f3cf/gi-docgen-2022.2.tar.gz
