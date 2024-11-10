kind: pyproject

build-depends:
- components/python3-build-bootstrap.bst
- components/python3-flit-core.bst
- components/python3-installer.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pypa/packaging.git
  track: '*.*'
  ref: 24.1-0-g85442b8032cb7bae72866dfd7782234a98dd2fb7
