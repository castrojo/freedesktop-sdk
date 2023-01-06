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
- kind: pypi
  name: gi-docgen
  ref:
    sha256sum: 88adeda9cbf882569479701eada009afa5d94fa29d728653ec388c32035f7fa3
    suffix: 29/72/a319bce143e5d10677bc89b66e750c1511ec005c7a8bb098b415cc68ac68/gi-docgen-2023.1.tar.gz
