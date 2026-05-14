kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst
- components/python3-urllib3.bst
- components/python3-certifi.bst
- components/python3-idna.bst
- components/python3-chardet.bst
- components/python3-charset-normalizer.bst

sources:
- kind: git_repo
  url: github:psf/requests.git
  track: v*
  exclude:
  - "*dev*"
  ref: v2.34.1-0-gb7b549b54571d03950b16afd2d01bc6ff0348224
