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
    sha256sum: 2fdb4f0f6b61184ab862fcfb41dafe1a795636de9fd8d21a8ca4feea3b6bf858
    suffix: 
      55/e1/c32a1ee817fc7d11462b4ed8722b049c70dd61ce0b236f74e7cf4262412e/gi_docgen-2025.3.tar.gz
