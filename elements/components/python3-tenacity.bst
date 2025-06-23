kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

build-depends:
  (>):
  - components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:jd/tenacity.git
  track: '*.*.*'
  ref: 9.1.4-0-gd4e868d6b8368c00b5a1fad54de36c2c8c3a0fb3
