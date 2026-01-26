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
  ref: v0.21.1-0-geae394d0b489fa62235dfb82cc549d3422372542
