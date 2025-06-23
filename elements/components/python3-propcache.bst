kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

build-depends:
  (>):
  - components/cython.bst
  - components/python3-expandvars.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:aio-libs/propcache.git
  track: v*
  ref: v0.4.1-0-g410fc9318e12b70c15e21c70ab75256d1c7b3f41
- kind: patch
  path: patches/python3-propcache/reproducible.patch
- kind: patch
  path: patches/python3-propcache/allow-cython.patch
