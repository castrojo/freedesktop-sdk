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
  ref: v2.33.1-0-g111d2b77790bf49943c0dfa09b365371c24aec7e
