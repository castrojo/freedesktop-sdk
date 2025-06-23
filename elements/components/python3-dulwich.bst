kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

build-depends:
  (>):
  - components/python3-setuptools-rust.bst
  - components/python3-setuptools-scm.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-certifi.bst
- components/python3-urllib3.bst

sources:
- kind: git_repo
  url: github:jelmer/dulwich.git
  track: dulwich-*.*.*
  ref: dulwich-1.1.0-0-g7dddd93c1e6f6d49e8b8911dab94e509710e90c8
