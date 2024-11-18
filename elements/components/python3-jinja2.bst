kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

runtime-depends:
- components/python3.bst
- components/python3-markupsafe.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pallets/jinja.git
  track: "*.*.*"
  exclude:
  - "*.*.x"
  ref: 3.1.4-0-gdd4a8b5466d8790540c181590b14db4d4d889d57
