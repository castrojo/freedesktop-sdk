kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/ninja.bst
- components/python3.bst
- components/python3-packaging.bst

sources:
- kind: git_repo
  url: github:nodejs/gyp-next.git
  track: v*
  ref: v0.22.0-0-g2b1e2243251b1d990e592be85c3a61b8d9a11a1e
