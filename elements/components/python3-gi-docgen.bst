kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-jinja2.bst
- components/python3-markdown.bst
- components/python3-markupsafe.bst
- components/python3-packaging.bst
- components/python3-pygments.bst
- components/python3-tomli.bst
- components/python3-typogrify.bst

sources:
- kind: pypi
  name: gi-docgen
  ref:
    sha256sum: 1836b6496fdc27aff345d12bac8d4b024416a23e0745c8fe0fd38884437a1fc7
    suffix: 
      e5/6e/9f05646d0dbfa537c9328204212e7d22942e656b9279d1d36d8efedf5dec/gi-docgen-2023.2.tar.gz
