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
    sha256sum: 977616bcc0e2735bb596c71e8eb34533526680740c666e87f9dfc323acd488f0
    suffix: 
      ec/4e/7ae06ba557a1ef86abcf33c299bf955a4cf69f0b8f6268c6e97029b6329f/gi-docgen-2023.3.tar.gz
