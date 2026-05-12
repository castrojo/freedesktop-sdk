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
  ref: v2.34.0-0-g0b401c76b6e80a4eecf3c690085b2553f6e261ca
