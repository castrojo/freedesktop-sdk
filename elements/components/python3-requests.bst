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
  ref: v2.32.3-0-g0e322af87745eff34caffe4df68456ebc20d9068
