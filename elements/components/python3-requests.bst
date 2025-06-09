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
  ref: v2.32.4-0-g021dc729f0b71a3030cefdbec7fb57a0e80a6cfd
