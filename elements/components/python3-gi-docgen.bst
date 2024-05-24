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
    sha256sum: 2a4a5569f91109777481aa71451751289227f7c2652cfac366184a41eb19c231
    suffix: 
      d1/86/d17f162d174b6340031fc96474405f13d50ceda4b6bf6588593cf31eb84b/gi_docgen-2024.1.tar.gz
