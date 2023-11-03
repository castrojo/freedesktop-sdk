kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: markdown
  ref:
    sha256sum: b65d7beb248dc22f2e8a31fb706d93798093c308dc1aba295aedeb9d41a813bd
    suffix: 
      35/14/1ec9742e151f3b06a723a20d9af7201a389ebd3aae8b7d93b521819489dc/Markdown-3.5.1.tar.gz
