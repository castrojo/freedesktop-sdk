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
- kind: pypi
  name: gi-docgen
  ref:
    sha256sum: 7fe066da082a4edcf924063767404f9d04a998f6c0f0c475b180fd9823a72dc5
    suffix: 
      49/03/b3202f4ae48f70db6c90402adf3350a8931034099ac6a006c5695d5e4740/gi_docgen-2025.4.tar.gz
